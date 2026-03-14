/* ════════════════════════════════════════════════════════════════
   Niche Configuration System

   Each niche is a config object that controls:
   - Theme (colors, gradients, branding)
   - Feature flags (which modules are enabled)
   - Destinations (which cities this niche serves)
   - Categories (activity categories for this niche)
   - Supported languages
   - Default settings
   ════════════════════════════════════════════════════════════════ */

export interface NicheFeatures {
  groupBooking: boolean;
  votingSystem: boolean;
  countdownTimer: boolean;
  expenseSplitting: boolean;
  guestList: boolean;
  profilePage: boolean;
  aiSchedule: boolean;
}

export interface NicheTheme {
  /** Tailwind color prefix, e.g. 'pink' → bg-pink-500, text-pink-700 */
  primary: string;
  /** Secondary accent color prefix */
  accent: string;
  /** Gradient classes for hero sections */
  heroGradient: string;
  /** Gradient for buttons and CTAs */
  ctaGradient: string;
  /** App name displayed in the UI */
  appName: string;
  /** Tagline shown on landing/header */
  tagline: Record<string, string>;
  /** Description for SEO / meta */
  description: Record<string, string>;
}

export interface CategoryColor {
  bg: string;
  border: string;
  text: string;
  badge: string;
  dot: string;
  light: string;
}

export interface NicheConfig {
  /** Unique niche identifier */
  id: string;
  /** Display name for the niche */
  name: Record<string, string>;
  /** Which destinations are available */
  destinations: string[];
  /** Enabled features */
  features: NicheFeatures;
  /** Visual theme */
  theme: NicheTheme;
  /** Activity categories for this niche */
  categories: string[];
  /** Color scheme per activity category (key = category name) */
  categoryColors: Record<string, CategoryColor>;
  /** Default currency */
  defaultCurrency: string;
  /** Supported languages (ISO codes) */
  supportedLanguages: string[];
  /** Default language */
  defaultLanguage: string;
  /** Minimum group size */
  minGroupSize: number;
  /** Default group size */
  defaultGroupSize: number;
}

/* ── Romantic Proposals niche ── */

export const proposalsConfig: NicheConfig = {
  id: 'proposals',
  name: {
    en: 'Romantic Proposals',
    fr: 'Demandes en Mariage',
  },
  destinations: ['essaouira', 'marrakech'],
  features: {
    groupBooking: false,
    votingSystem: false,
    countdownTimer: true,
    expenseSplitting: false,
    guestList: false,
    profilePage: true,
    aiSchedule: true,
  },
  theme: {
    primary: 'rose',
    accent: 'pink',
    heroGradient: 'from-rose-400 via-pink-500 to-fuchsia-500',
    ctaGradient: 'from-rose-400 to-pink-500',
    appName: 'QTRIP',
    tagline: {
      en: 'The perfect moment, perfectly planned',
      fr: 'Le moment parfait, parfaitement organisé',
    },
    description: {
      en: 'Plan the perfect romantic proposal in Essaouira or Marrakech. Sunset moments, intimate dinners, and unforgettable experiences.',
      fr: 'Organisez la demande en mariage parfaite à Essaouira ou Marrakech. Couchers de soleil, dîners intimes et expériences inoubliables.',
    },
  },
  categories: [
    'Romantic Experiences',
    'Culture & Discovery',
    'Adventure & Active',
    'Food & Wine',
    'Wellness & Spa',
    'Photography',
  ],
  categoryColors: {
    'Romantic Experiences': { bg: 'bg-rose-50',   border: 'border-rose-300',   text: 'text-rose-700',   badge: 'bg-rose-100 text-rose-700',     dot: 'bg-rose-400',   light: 'bg-rose-50/60' },
    'Culture & Discovery': { bg: 'bg-violet-50', border: 'border-violet-300', text: 'text-violet-700', badge: 'bg-violet-100 text-violet-700', dot: 'bg-violet-400', light: 'bg-violet-50/60' },
    'Adventure & Active':  { bg: 'bg-sky-50',    border: 'border-sky-300',    text: 'text-sky-700',    badge: 'bg-sky-100 text-sky-700',       dot: 'bg-sky-400',    light: 'bg-sky-50/60' },
    'Food & Wine':         { bg: 'bg-amber-50',  border: 'border-amber-300',  text: 'text-amber-700',  badge: 'bg-amber-100 text-amber-700',   dot: 'bg-amber-400',  light: 'bg-amber-50/60' },
    'Wellness & Spa':      { bg: 'bg-teal-50',   border: 'border-teal-300',   text: 'text-teal-700',   badge: 'bg-teal-100 text-teal-700',     dot: 'bg-teal-400',   light: 'bg-teal-50/60' },
    'Photography':         { bg: 'bg-pink-50',   border: 'border-pink-300',   text: 'text-pink-700',   badge: 'bg-pink-100 text-pink-700',     dot: 'bg-pink-400',   light: 'bg-pink-50/60' },
  },
  defaultCurrency: 'EUR',
  supportedLanguages: ['en', 'fr'],
  defaultLanguage: 'en',
  minGroupSize: 2,
  defaultGroupSize: 2,
};

/* ── Active niche ── */
// Change this to switch niches. In the future this could come from
// an env variable, subdomain detection, or a database lookup.
export const activeNiche: NicheConfig = proposalsConfig;
