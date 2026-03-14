import { useMemo, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import { Camera, Check, Heart, Sparkles } from 'lucide-react';
import { useActivities } from '../hooks/useCatalog';
import { useTripStore } from '../store/tripStore';
import { ActivityCardSkeleton } from '../components/Skeleton';
import { activeNiche } from '../config/niche';
import { tc } from '../config/themeClasses';
import type { Activity } from '../lib/types';

interface ProposalMomentProps {
  onNext: () => void;
  onBack: () => void;
}

export function ProposalMoment({ onNext, onBack }: ProposalMomentProps) {
  const { t } = useTranslation();
  const navigate = useNavigate();
  const { selectedDestination, selectedActivities, addActivity, removeActivity, travelers } = useTripStore();
  const { activities, loading } = useActivities(selectedDestination?.id);
  const [photographerAdded, setPhotographerAdded] = useState<Record<string, boolean>>({});

  // Guard: redirect to preferences if no destination
  if (!selectedDestination) {
    return (
      <div className="rounded-2xl border border-slate-200 bg-white p-8 text-center shadow-sm">
        <h1 className="text-xl font-semibold text-slate-900">{t('activities.noDestination')}</h1>
        <p className="mt-2 text-sm text-slate-500">{t('activities.noDestinationSub')}</p>
        <button onClick={() => navigate('/preferences')} className="mt-5 rounded-xl bg-slate-900 px-5 py-2.5 text-sm text-white">{t('activities.backToPrefs')}</button>
      </div>
    );
  }

  // Filter activities by category
  const romanticActivities = useMemo(
    () => activities.filter((a) => a.category === 'Romantic Experiences').slice(0, 3),
    [activities]
  );

  const photographyActivities = useMemo(
    () => activities.filter((a) => a.category === 'Photography'),
    [activities]
  );

  const photographyActivity = photographyActivities[0] || null;

  const handleChooseScenario = (activity: Activity) => {
    // Remove any previously selected romantic activities
    selectedActivities
      .filter((a) => a.category === 'Romantic Experiences')
      .forEach((a) => removeActivity(a.id));

    addActivity(activity);

    // If photographer was toggled for this scenario, add it too
    if (photographerAdded[activity.id] && photographyActivity) {
      if (!selectedActivities.some((a) => a.id === photographyActivity.id)) {
        addActivity(photographyActivity);
      }
    }

    onNext();
  };

  const togglePhotographer = (scenarioId: string) => {
    setPhotographerAdded((prev) => ({ ...prev, [scenarioId]: !prev[scenarioId] }));
  };

  if (loading) {
    return (
      <div className="space-y-6 pb-28">
        <section className="rounded-2xl border border-slate-200 bg-white p-5 shadow-sm sm:p-6">
          <h1 className="text-2xl font-semibold text-slate-900 sm:text-3xl">{t('proposals.momentTitle')}</h1>
          <p className="mt-2 text-sm text-slate-500">{t('proposals.momentSubtitle', { destination: selectedDestination.name })}</p>
        </section>
        <div className="grid gap-6 lg:grid-cols-2 xl:grid-cols-3">
          {Array.from({ length: 3 }).map((_, i) => (
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
          <Sparkles size={16} />
          <span className="text-sm font-medium">{t('proposals.momentTitle')}</span>
        </div>
        <h1 className="mt-2 text-2xl font-semibold text-slate-900 sm:text-3xl">
          {t('proposals.momentTitle')}
        </h1>
        <p className="mt-2 max-w-2xl text-sm text-slate-500">
          {t('proposals.momentSubtitle', { destination: selectedDestination.name })}
        </p>
      </section>

      {/* Scenario Cards */}
      {romanticActivities.length === 0 ? (
        <section className="rounded-2xl border border-slate-200 bg-white p-8 text-center shadow-sm">
          <Heart size={40} className="mx-auto text-slate-200" />
          <p className="mt-3 text-lg font-medium text-slate-600">{t('activities.noActivities')}</p>
          <p className="mt-1 text-sm text-slate-400">{t('activities.noActivitiesSub')}</p>
        </section>
      ) : (
        <div className="grid gap-6 lg:grid-cols-2 xl:grid-cols-3">
          {romanticActivities.map((activity) => {
            const isSelected = selectedActivities.some((a) => a.id === activity.id);
            const photoToggled = photographerAdded[activity.id] ?? false;

            return (
              <div
                key={activity.id}
                className={`group relative overflow-hidden rounded-2xl border bg-white shadow-sm transition-all hover:-translate-y-0.5 hover:shadow-lg ${
                  isSelected ? tc.selectedRing : 'border-slate-200'
                }`}
              >
                {/* Large image */}
                <div className="relative aspect-[16/10] overflow-hidden">
                  {activity.mainImageUrl ? (
                    <img
                      src={activity.mainImageUrl}
                      alt={activity.title}
                      className="h-full w-full object-cover transition-transform duration-500 group-hover:scale-105"
                    />
                  ) : (
                    <div className="flex h-full w-full items-center justify-center bg-slate-100">
                      <Heart size={40} className="text-slate-300" />
                    </div>
                  )}
                  <div className="absolute inset-x-0 bottom-0 bg-gradient-to-t from-slate-950/70 via-slate-950/20 to-transparent p-4 text-white">
                    <h3 className="text-lg font-semibold leading-tight">{activity.title}</h3>
                    <p className="mt-0.5 text-xs text-white/70">{activity.duration}h &middot; {activity.location}</p>
                  </div>
                  {isSelected && (
                    <div className="absolute right-3 top-3 rounded-full bg-emerald-500 p-1.5 text-white shadow-lg">
                      <Check size={14} />
                    </div>
                  )}
                </div>

                {/* Content */}
                <div className="space-y-4 p-5">
                  <p className="text-sm text-slate-600 line-clamp-3">{activity.description}</p>

                  {/* What's included */}
                  {activity.tags && activity.tags.length > 0 && (
                    <div>
                      <p className="text-xs font-semibold uppercase tracking-wide text-slate-400">{t('proposals.included')}</p>
                      <div className="mt-1.5 flex flex-wrap gap-1.5">
                        {activity.tags.slice(0, 4).map((tag) => (
                          <span key={tag} className={`rounded-full px-2 py-0.5 text-xs font-medium ${tc.tagPrimary}`}>{tag}</span>
                        ))}
                      </div>
                    </div>
                  )}

                  {/* Price */}
                  <div className="flex items-center justify-between">
                    <span className={`text-lg font-bold ${tc.textPrimary}`}>
                      &euro;{activity.price * travelers}
                    </span>
                    <span className="text-xs text-slate-400">{travelers} {t('common.travelers')}</span>
                  </div>

                  {/* Photography add-on */}
                  {photographyActivity && (
                    <label className="flex cursor-pointer items-center gap-3 rounded-xl border border-slate-200 bg-slate-50 p-3 transition-colors hover:bg-slate-100">
                      <input
                        type="checkbox"
                        checked={photoToggled}
                        onChange={() => togglePhotographer(activity.id)}
                        className="h-4 w-4 rounded border-slate-300 text-rose-500 focus:ring-rose-400"
                      />
                      <Camera size={16} className="text-slate-500" />
                      <div className="flex-1">
                        <span className="text-sm font-medium text-slate-700">{t('proposals.addPhotographer')}</span>
                        <span className="ml-2 text-xs text-slate-400">&euro;{photographyActivity.price * travelers}</span>
                      </div>
                    </label>
                  )}

                  {/* CTA */}
                  <button
                    onClick={() => handleChooseScenario(activity)}
                    className={`flex w-full items-center justify-center gap-2 rounded-xl ${tc.btnGradient} px-5 py-3 text-sm font-medium text-white shadow-md transition-all ${tc.btnGradientHover} hover:shadow-lg`}
                  >
                    <Heart size={16} />
                    {t('proposals.chooseThis')}
                  </button>
                </div>
              </div>
            );
          })}
        </div>
      )}

      {/* Back button */}
      <div className="flex justify-start">
        <button onClick={onBack} className="rounded-xl border border-slate-200 px-5 py-2.5 text-sm text-slate-700 hover:bg-slate-50">
          {t('common.back')}
        </button>
      </div>
    </div>
  );
}
