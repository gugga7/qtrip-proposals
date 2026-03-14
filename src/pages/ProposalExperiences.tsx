import { useMemo, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import { Compass, Heart } from 'lucide-react';
import { useActivities } from '../hooks/useCatalog';
import { ProductCard } from '../components/ProductCard';
import { ProductModal } from '../components/ProductModal';
import { FloatingContinueButton } from '../components/FloatingContinueButton';
import { ActivityCardSkeleton } from '../components/Skeleton';
import { useTripStore } from '../store/tripStore';
import { tc } from '../config/themeClasses';
import type { Activity } from '../lib/types';

interface ProposalExperiencesProps {
  onNext: () => void;
  onBack: () => void;
}

const BEFORE_CATEGORIES = ['Food & Wine', 'Wellness & Spa'];
const AFTER_CATEGORIES = ['Adventure & Active', 'Culture & Discovery'];
const EXCLUDED_CATEGORIES = ['Romantic Experiences', 'Photography'];

export function ProposalExperiences({ onNext, onBack }: ProposalExperiencesProps) {
  const { t } = useTranslation();
  const navigate = useNavigate();
  const { selectedDestination, selectedActivities, addActivity, removeActivity, travelers, setActivityParticipants } = useTripStore();
  const { activities, loading } = useActivities(selectedDestination?.id);
  const [activeActivity, setActiveActivity] = useState<Activity | null>(null);

  // Guard: redirect if no destination
  if (!selectedDestination) {
    return (
      <div className="rounded-2xl border border-slate-200 bg-white p-8 text-center shadow-sm">
        <h1 className="text-xl font-semibold text-slate-900">{t('activities.noDestination')}</h1>
        <p className="mt-2 text-sm text-slate-500">{t('activities.noDestinationSub')}</p>
        <button onClick={() => navigate('/preferences')} className="mt-5 rounded-xl bg-slate-900 px-5 py-2.5 text-sm text-white">{t('activities.backToPrefs')}</button>
      </div>
    );
  }

  // Filter out Romantic Experiences and Photography
  const availableActivities = useMemo(
    () => activities.filter((a) => !EXCLUDED_CATEGORIES.includes(a.category)),
    [activities]
  );

  const beforeActivities = useMemo(
    () => availableActivities.filter((a) => BEFORE_CATEGORIES.includes(a.category)).slice(0, 4),
    [availableActivities]
  );

  const afterActivities = useMemo(
    () => availableActivities.filter((a) => AFTER_CATEGORIES.includes(a.category)).slice(0, 4),
    [availableActivities]
  );

  const renderSection = (title: string, sectionActivities: Activity[]) => (
    <section className="space-y-4">
      <div className="flex items-center gap-2">
        <Heart size={16} className={tc.textPrimaryMid} />
        <h2 className="text-lg font-semibold text-slate-900">{title}</h2>
      </div>
      {sectionActivities.length === 0 ? (
        <p className="text-sm text-slate-400">{t('activities.noActivities')}</p>
      ) : (
        <div className="grid gap-5 sm:grid-cols-2 xl:grid-cols-3">
          {sectionActivities.map((activity) => (
            <ProductCard
              key={activity.id}
              product={activity}
              type="activity"
              isSelected={selectedActivities.some((item) => item.id === activity.id)}
              onSelect={() => setActiveActivity(activity)}
              onQuickAdd={(e) => { e.stopPropagation(); addActivity(activity); }}
              onQuickRemove={(e) => { e.stopPropagation(); removeActivity(activity.id); }}
              participants={selectedActivities.find((item) => item.id === activity.id)?.participants}
              travelers={travelers}
              onParticipantsChange={(count) => setActivityParticipants(activity.id, count)}
            />
          ))}
        </div>
      )}
    </section>
  );

  if (loading) {
    return (
      <div className="space-y-6 pb-28">
        <section className="rounded-2xl border border-slate-200 bg-white p-5 shadow-sm sm:p-6">
          <h1 className="text-2xl font-semibold text-slate-900 sm:text-3xl">{t('proposals.experiencesTitle')}</h1>
          <p className="mt-2 text-sm text-slate-500">{t('proposals.experiencesSubtitle')}</p>
        </section>
        <div className="grid gap-5 sm:grid-cols-2 xl:grid-cols-3">
          {Array.from({ length: 6 }).map((_, i) => (
            <ActivityCardSkeleton key={i} />
          ))}
        </div>
      </div>
    );
  }

  return (
    <div className="space-y-6 pb-28">
      {/* Header */}
      <section className="rounded-2xl border border-slate-200 bg-white p-5 shadow-sm sm:p-6">
        <div className={`flex items-center gap-2 ${tc.scheduleHeaderText}`}>
          <Compass size={16} />
          <span className="text-sm font-medium">{t('proposals.experiencesTitle')}</span>
        </div>
        <h1 className="mt-2 text-2xl font-semibold text-slate-900 sm:text-3xl">
          {t('proposals.experiencesTitle')}
        </h1>
        <p className="mt-2 max-w-2xl text-sm text-slate-500">
          {t('proposals.experiencesSubtitle')}
        </p>
      </section>

      {/* Before the Proposal */}
      {renderSection(t('proposals.beforeProposal'), beforeActivities)}

      {/* After the Proposal */}
      {renderSection(t('proposals.afterProposal'), afterActivities)}

      <ProductModal
        isOpen={!!activeActivity}
        onClose={() => setActiveActivity(null)}
        product={activeActivity}
        type="activity"
        onQuickAdd={(e, product) => addActivity(product as Activity)}
        onQuickRemove={(e, product) => removeActivity((product as Activity).id)}
        isSelected={!!activeActivity && selectedActivities.some((item) => item.id === activeActivity.id)}
      />

      <FloatingContinueButton
        onContinue={onNext}
        onBack={onBack}
        isValid={true}
        currentStep={3}
        totalSteps={4}
        validationMessages={[]}
        nextText={t('proposals.continueToBook')}
      />
    </div>
  );
}
