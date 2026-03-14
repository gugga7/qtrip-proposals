-- Proposals niche: Essaouira & Marrakech destinations, activities, accommodations, transports

-- ═══════════════════════════════════════════════
-- DESTINATIONS
-- ═══════════════════════════════════════════════

INSERT INTO destinations (id, name, country, description, hero_image_url, currency, language, best_time_to_visit, highlights, local_tips, health_and_safety, travel_requirements, niche_id, is_active)
VALUES (
  'essaouira', 'Essaouira', 'Morocco',
  'A windswept coastal gem where rampart sunsets paint the sky in amber and rose, intimate riads hide behind blue-washed medina walls, and the haunting melodies of Gnawa music drift through lantern-lit alleys — the most romantic backdrop for a proposal on the Atlantic coast.',
  'https://images.unsplash.com/photo-1569383746724-6f1b882b8f46?w=800',
  'EUR', 'French/Arabic',
  ARRAY['Mar-May', 'Sep-Nov'],
  ARRAY['Ramparts sunset', 'Blue medina', 'Gnawa music', 'Fishing port'],
  ARRAY['The medina is car-free — perfect for hand-in-hand strolls', 'Book riad rooftop dinners at least 2 days ahead', 'The wind picks up in the afternoon — mornings are calmer for beach activities', 'Gnawa musicians perform nightly at Place Moulay Hassan'],
  ARRAY['Tap water is not recommended — drink bottled', 'Pharmacies are well stocked in the medina', 'No special vaccinations needed'],
  ARRAY['Passport valid 6+ months', 'No visa needed for EU/US citizens (90 days)'],
  'proposals', true
) ON CONFLICT (id) DO NOTHING;

INSERT INTO destinations (id, name, country, description, hero_image_url, currency, language, best_time_to_visit, highlights, local_tips, health_and_safety, travel_requirements, niche_id, is_active)
VALUES (
  'marrakech', 'Marrakech', 'Morocco',
  'The Red City casts an irresistible spell on lovers — from candlelit riad courtyards draped in rose petals to rooftop terraces where the Atlas Mountains glow at sunset, every corner whispers romance. The perfect stage for an unforgettable proposal.',
  'https://images.unsplash.com/photo-1597212618440-806262de4f6b?w=800',
  'EUR', 'French/Arabic',
  ARRAY['Mar-May', 'Oct-Dec'],
  ARRAY['Riad courtyards', 'Majorelle Garden', 'Atlas Mountain views', 'Jemaa el-Fna at dusk'],
  ARRAY['Book private experiences well in advance — romantic surprises need coordination', 'Riads in the medina offer the most intimate atmosphere', 'Hot air balloons launch at dawn — plan the night before accordingly', 'Negotiate taxi fares before getting in'],
  ARRAY['Tap water is not recommended — drink bottled', 'Pharmacies available in Guéliz and the medina', 'No special vaccinations needed'],
  ARRAY['Passport valid 6+ months', 'No visa needed for EU/US citizens (90 days)'],
  'proposals', true
) ON CONFLICT (id) DO NOTHING;

-- ═══════════════════════════════════════════════
-- ESSAOUIRA ACTIVITIES
-- ═══════════════════════════════════════════════

INSERT INTO activities (id, destination_id, title, description, duration, price, category, location, tags, main_image_url, is_active) VALUES
('ess-rampart-sunset', 'essaouira', 'Sunset Rampart Walk with Champagne', 'Stroll hand-in-hand along the historic ramparts as the Atlantic sun melts into the horizon. A private guide leads you to the most secluded viewpoint where chilled champagne and canapés await.', 2, 55, 'Romantic Experiences', 'Ramparts', ARRAY['romantic', 'sunset', 'champagne', 'evening'], 'https://images.unsplash.com/photo-1548013146-72479768bada?w=400', true),
('ess-riad-dinner', 'essaouira', 'Private Riad Rooftop Dinner', 'An intimate candlelit dinner for two on a private riad rooftop with ocean views. Four-course Moroccan menu, rose petals, and live oud music under the stars.', 3, 90, 'Romantic Experiences', 'Medina', ARRAY['romantic', 'dinner', 'private', 'evening'], 'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?w=400', true),
('ess-hammam-couple', 'essaouira', 'Couple''s Hammam & Argan Massage', 'Traditional Moroccan hammam ritual for two — black soap scrub, rhassoul clay, and a relaxing argan oil massage in a private steam room.', 2.5, 70, 'Wellness & Spa', 'Medina', ARRAY['wellness', 'spa', 'couples', 'afternoon'], 'https://images.unsplash.com/photo-1544161515-4ab6ce6db874?w=400', true),
('ess-horse-beach', 'essaouira', 'Horse Ride on the Beach', 'Gallop along Essaouira''s endless sandy beach at golden hour. Gentle horses for all levels, with a guide who knows the most photogenic stretches.', 2, 65, 'Adventure & Active', 'Beach', ARRAY['adventure', 'romantic', 'beach', 'afternoon'], 'https://images.unsplash.com/photo-1553284965-83fd3e82fa5a?w=400', true),
('ess-art-gallery', 'essaouira', 'Medina Art Gallery Tour', 'Discover Essaouira''s thriving art scene with a private guide through hidden galleries and ateliers. Meet local artists and find a meaningful keepsake together.', 2, 25, 'Culture & Discovery', 'Medina', ARRAY['culture', 'art', 'walking', 'morning'], 'https://images.unsplash.com/photo-1531913764164-f85c3e01b1ac?w=400', true),
('ess-gnawa-evening', 'essaouira', 'Gnawa Music Evening', 'An enchanting private Gnawa music performance in a candlelit riad courtyard. Learn about this UNESCO-recognized tradition while sipping mint tea together.', 2, 35, 'Culture & Discovery', 'Medina', ARRAY['culture', 'music', 'evening', 'romantic'], 'https://images.unsplash.com/photo-1511192336575-5a79af67a629?w=400', true),
('ess-port-lunch', 'essaouira', 'Fishing Port Fresh Lunch', 'Pick your fish at the bustling port and have it grilled on the spot. A wonderfully authentic experience with the freshest seafood in Morocco.', 1.5, 30, 'Food & Wine', 'Fishing Port', ARRAY['food', 'seafood', 'local', 'afternoon'], 'https://images.unsplash.com/photo-1534604973900-c43ab4c2e0ab?w=400', true),
('ess-surf-lesson', 'essaouira', 'Surf Lesson for Two', 'Catch your first waves together with a patient local instructor. All equipment provided. Essaouira''s consistent swells make it perfect for beginners.', 2.5, 50, 'Adventure & Active', 'Beach', ARRAY['adventure', 'surf', 'beach', 'morning'], 'https://images.unsplash.com/photo-1502680390548-bdbac40e2009?w=400', true),
('ess-kitesurf', 'essaouira', 'Kitesurfing Intro for Two', 'Feel the rush of the Alizé trade winds on a tandem kitesurfing introduction. Safety briefing, beach practice, and supervised water time.', 3, 60, 'Adventure & Active', 'Sidi Kaouki Beach', ARRAY['adventure', 'kitesurf', 'active', 'morning'], 'https://images.unsplash.com/photo-1559339352-11d035aa65de?w=400', true),
('ess-camel-sunset', 'essaouira', 'Camel Ride on the Beach at Sunset', 'A gentle camel trek along the windswept beach as the sun dips below the Atlantic. Mint tea served at a Berber camp midway. Pure magic.', 2, 45, 'Romantic Experiences', 'Beach', ARRAY['romantic', 'camel', 'sunset', 'evening'], 'https://images.unsplash.com/photo-1548690312-e3b507d8c110?w=400', true),
('ess-seafood-tasting', 'essaouira', 'Seafood Tasting at the Port', 'A guided tasting of Essaouira''s finest catches — oysters, prawns, sea urchin, and grilled sardines — with a local foodie who knows every stall.', 1.5, 25, 'Food & Wine', 'Fishing Port', ARRAY['food', 'seafood', 'tasting', 'afternoon'], 'https://images.unsplash.com/photo-1559339352-11d035aa65de?w=400', true),
('ess-cooking-class', 'essaouira', 'Private Cooking Class for Two', 'Learn to make traditional Moroccan dishes together — tagine, pastilla, and preserved lemons — in a charming riad kitchen with a local chef.', 3, 65, 'Food & Wine', 'Medina', ARRAY['food', 'cooking', 'couples', 'morning'], 'https://images.unsplash.com/photo-1556910103-1c02745aae4d?w=400', true),
('ess-photoshoot', 'essaouira', 'Professional Couple''s Photoshoot', 'A 90-minute photoshoot through Essaouira''s most romantic spots — blue doors, rampart arches, and the ocean. 30+ edited photos delivered within 48 hours.', 1.5, 120, 'Photography', 'Medina & Ramparts', ARRAY['photography', 'couples', 'romantic', 'morning'], 'https://images.unsplash.com/photo-1519741497674-611481863552?w=400', true)
ON CONFLICT (id) DO NOTHING;

-- ═══════════════════════════════════════════════
-- MARRAKECH PROPOSALS ACTIVITIES
-- ═══════════════════════════════════════════════

INSERT INTO activities (id, destination_id, title, description, duration, price, category, location, tags, main_image_url, is_active) VALUES
('mkch-balloon', 'marrakech', 'Hot Air Balloon Sunrise Proposal', 'Float above the Atlas Mountains as dawn breaks in gold and pink. A private basket, champagne toast, and a moment suspended in time — the ultimate proposal setting.', 3, 200, 'Romantic Experiences', 'Atlas Foothills', ARRAY['romantic', 'proposal', 'sunrise', 'morning'], 'https://images.unsplash.com/photo-1507608616759-54f48f0af0ee?w=400', true),
('mkch-riad-dinner', 'marrakech', 'Private Riad Dinner with Musicians', 'A rose-petal-strewn courtyard, candlelight reflecting in the fountain, five-course feast, and live Andalusian musicians playing just for you two.', 3.5, 120, 'Romantic Experiences', 'Medina', ARRAY['romantic', 'dinner', 'music', 'evening'], 'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?w=400', true),
('mkch-rose-bath', 'marrakech', 'Rose Petal Bath Ritual', 'A luxurious private bath drawn with hundreds of fresh Damascena rose petals, followed by an argan oil massage for two in a candlelit spa suite.', 2, 80, 'Wellness & Spa', 'Riad Spa', ARRAY['wellness', 'romantic', 'roses', 'afternoon'], 'https://images.unsplash.com/photo-1544161515-4ab6ce6db874?w=400', true),
('mkch-majorelle', 'marrakech', 'Majorelle Garden Private Tour', 'Before the crowds arrive, explore the cobalt-blue paradise with a private guide. Secret corners, the YSL memorial, and a professional photo at the iconic blue wall.', 2, 55, 'Culture & Discovery', 'Guéliz', ARRAY['culture', 'garden', 'private', 'morning'], 'https://images.unsplash.com/photo-1569383746724-6f1b882b8f46?w=400', true),
('mkch-calligraphy', 'marrakech', 'Calligraphy Class for Two', 'Learn Arabic calligraphy from a master calligrapher and create a personalized artwork with your names or a love verse to take home.', 2, 40, 'Culture & Discovery', 'Medina', ARRAY['culture', 'art', 'couples', 'morning'], 'https://images.unsplash.com/photo-1531913764164-f85c3e01b1ac?w=400', true),
('mkch-treasure-hunt', 'marrakech', 'Private Medina Treasure Hunt', 'A bespoke treasure hunt through the labyrinthine souks — clues lead through spice stalls, hidden riads, and artisan workshops, ending with a surprise at a secret rooftop.', 2.5, 50, 'Culture & Discovery', 'Medina', ARRAY['culture', 'adventure', 'couples', 'morning'], 'https://images.unsplash.com/photo-1489749798305-4fea3ae63d43?w=400', true),
('mkch-rooftop-dinner', 'marrakech', 'Rooftop Dinner Under the Stars', 'Dine on a private rooftop with panoramic views of the Koutoubia minaret and Atlas Mountains. Chef''s tasting menu, starlight, and the muezzin''s call at dusk.', 3, 85, 'Food & Wine', 'Medina', ARRAY['food', 'dinner', 'rooftop', 'evening'], 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=400', true),
('mkch-wine-palace', 'marrakech', 'Wine Tasting in a Palace', 'Discover Moroccan and French wines in the opulent salon of a restored palace. Sommelier-led, paired with local cheeses and dried fruits.', 2, 60, 'Food & Wine', 'Medina', ARRAY['food', 'wine', 'palace', 'afternoon'], 'https://images.unsplash.com/photo-1510812431401-41d2bd2722f3?w=400', true),
('mkch-spa-day', 'marrakech', 'Couple''s Spa Day', 'A full day of pampering — hammam, body scrub, facial, and hot-stone massage in a private suite. Lunch served poolside between treatments.', 5, 90, 'Wellness & Spa', 'Palmeraie', ARRAY['wellness', 'spa', 'couples', 'morning'], 'https://images.unsplash.com/photo-1544161515-4ab6ce6db874?w=400', true),
('mkch-hammam', 'marrakech', 'Traditional Hammam for Two', 'The classic Moroccan hammam experience reimagined for couples — black soap, eucalyptus steam, rhassoul clay, and an argan oil massage in a private room.', 2.5, 65, 'Wellness & Spa', 'Medina', ARRAY['wellness', 'hammam', 'couples', 'afternoon'], 'https://images.unsplash.com/photo-1544161515-4ab6ce6db874?w=400', true),
('mkch-photoshoot', 'marrakech', 'Professional Proposal Photoshoot', 'A discreet photographer captures the proposal moment and the joy that follows. 2-hour session through Marrakech''s most romantic backdrops. 50+ edited photos.', 2, 150, 'Photography', 'Medina & Palaces', ARRAY['photography', 'proposal', 'romantic', 'morning'], 'https://images.unsplash.com/photo-1519741497674-611481863552?w=400', true),
('mkch-photo-walk', 'marrakech', 'Secret Medina Photo Walk', 'An intimate guided walk through hidden medina gems — zellige fountains, carved cedar doors, and sun-dappled alleys — with a professional photographer capturing every moment.', 2, 70, 'Photography', 'Medina', ARRAY['photography', 'walking', 'couples', 'morning'], 'https://images.unsplash.com/photo-1519741497674-611481863552?w=400', true)
ON CONFLICT (id) DO NOTHING;

-- ═══════════════════════════════════════════════
-- ESSAOUIRA ACCOMMODATIONS
-- ═══════════════════════════════════════════════

INSERT INTO accommodations (id, destination_id, name, type, description, location, price_per_night, rating, amenities, main_image_url, is_active) VALUES
('ess-riad-romance', 'essaouira', 'Riad Romance', 'Riad', 'A jewel-box riad with just four suites, a jasmine-scented courtyard, and a rooftop terrace with Atlantic views. Candlelit breakfasts included.', 'Medina', 95, 5, ARRAY['wifi', 'rooftop-terrace', 'breakfast-included', 'courtyard', 'ocean-view'], 'https://images.unsplash.com/photo-1548018560-c7196548e84d?w=400', true),
('ess-ocean-suite', 'essaouira', 'Ocean View Suite', 'Boutique Hotel', 'A luxurious suite with floor-to-ceiling windows overlooking the Atlantic. King bed, freestanding bathtub, and private balcony with sunset views.', 'Ramparts', 130, 5, ARRAY['wifi', 'ocean-view', 'balcony', 'bathtub', 'room-service', 'breakfast-included'], 'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=400', true),
('ess-riad-blue', 'essaouira', 'Riad Bleu Mogador', 'Riad', 'A romantic blue-and-white riad with a plunge pool, hammam, and rooftop views of the medina and ocean. Six intimate rooms.', 'Medina', 78, 4, ARRAY['wifi', 'plunge-pool', 'hammam', 'rooftop-terrace', 'breakfast-included'], 'https://images.unsplash.com/photo-1548018560-c7196548e84d?w=400', true),
('ess-boutique-wind', 'essaouira', 'Hôtel des Alizés', 'Boutique Hotel', 'A charming boutique hotel where Atlantic breezes meet Moroccan elegance. Cozy rooms with handcrafted furniture and a serene garden courtyard.', 'Medina', 65, 4, ARRAY['wifi', 'garden', 'breakfast-included', 'air-conditioning', 'restaurant'], 'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400', true),
('ess-riad-secret', 'essaouira', 'Riad Le Secret', 'Riad', 'Hidden behind an unmarked door, this intimate three-room riad is the definition of romantic escape. Rooftop hammam and stargazing terrace.', 'Medina', 85, 4, ARRAY['wifi', 'hammam', 'rooftop-terrace', 'breakfast-included', 'concierge'], 'https://images.unsplash.com/photo-1548018560-c7196548e84d?w=400', true),
('ess-beach-lodge', 'essaouira', 'Essaouira Beach Lodge', 'Boutique Hotel', 'A laid-back beachfront lodge with boho-chic rooms, a surf shack, and direct access to the sand. Perfect for adventurous couples.', 'Beach', 55, 3, ARRAY['wifi', 'beach-access', 'restaurant', 'surf-equipment', 'terrace'], 'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=400', true)
ON CONFLICT (id) DO NOTHING;

-- ═══════════════════════════════════════════════
-- MARRAKECH PROPOSALS ACCOMMODATIONS
-- ═══════════════════════════════════════════════

INSERT INTO accommodations (id, destination_id, name, type, description, location, price_per_night, rating, amenities, main_image_url, is_active) VALUES
('mkch-riad-rose', 'marrakech', 'Riad des Roses', 'Riad', 'An exquisite riad where every detail whispers romance — rose-petal turndown, candlelit courtyard dinners, and a private rooftop suite with Atlas views.', 'Medina', 140, 5, ARRAY['wifi', 'rooftop-terrace', 'breakfast-included', 'courtyard', 'concierge', 'rose-petal-service'], 'https://images.unsplash.com/photo-1548018560-c7196548e84d?w=400', true),
('mkch-palace', 'marrakech', 'Palais de l''Amour', 'Palace', 'A restored 18th-century palace with just six suites, a heated pool, hammam, and a dedicated butler. The ultimate proposal backdrop.', 'Medina', 220, 5, ARRAY['wifi', 'heated-pool', 'hammam', 'butler', 'breakfast-included', 'restaurant', 'spa'], 'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=400', true),
('mkch-riad-lux', 'marrakech', 'Riad Luxe Romantique', 'Riad', 'Boutique luxury riad with plunge pool, private hammam suite, and personalized romance packages including champagne and flowers on arrival.', 'Medina', 110, 5, ARRAY['wifi', 'plunge-pool', 'hammam', 'concierge', 'breakfast-included', 'champagne-welcome'], 'https://images.unsplash.com/photo-1548018560-c7196548e84d?w=400', true),
('mkch-suite-atlas', 'marrakech', 'Suite Atlas Panorama', 'Boutique Hotel', 'A modern boutique hotel with a rooftop infinity pool and Atlas Mountain views. The honeymoon suite has a freestanding copper bathtub and private terrace.', 'Hivernage', 160, 5, ARRAY['wifi', 'infinity-pool', 'rooftop-terrace', 'bathtub', 'room-service', 'spa'], 'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=400', true),
('mkch-riad-garden', 'marrakech', 'Riad Jardin Secret', 'Riad', 'A tranquil riad with a lush interior garden, fountain, and intimate rooms decorated with traditional zellige and tadelakt. Breakfast on the rooftop.', 'Medina', 85, 4, ARRAY['wifi', 'garden', 'rooftop-terrace', 'breakfast-included', 'courtyard'], 'https://images.unsplash.com/photo-1548018560-c7196548e84d?w=400', true),
('mkch-villa-palm', 'marrakech', 'Villa Palmeraie Privée', 'Villa', 'A secluded private villa in the Palmeraie with heated pool, tropical garden, and dedicated staff. Ideal for a proposal weekend away from the bustle.', 'Palmeraie', 180, 5, ARRAY['wifi', 'private-pool', 'garden', 'staff', 'breakfast-included', 'parking', 'bbq'], 'https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?w=400', true)
ON CONFLICT (id) DO NOTHING;

-- ═══════════════════════════════════════════════
-- ESSAOUIRA TRANSPORTS
-- ═══════════════════════════════════════════════

INSERT INTO transports (id, destination_id, name, type, provider, price, duration, description, features, pricing_unit, main_image_url, is_active) VALUES
('ess-private-transfer', 'essaouira', 'Private Car Transfer', 'private_car', 'Essaouira VIP Transfers', 65, '2h 30min', 'Private car transfer from Marrakech airport to Essaouira. Air-conditioned vehicle, bottled water, and a scenic coastal drive.', ARRAY['private', 'air-conditioning', 'water', 'door-to-door'], 'per_trip', 'https://images.unsplash.com/photo-1606664515524-ed2f786a0bd6?w=400', true),
('ess-luxury-transfer', 'essaouira', 'Luxury Mercedes Transfer', 'luxury_car', 'Essaouira VIP Transfers', 120, '2h 30min', 'Premium Mercedes E-Class transfer with leather seats, champagne welcome, and a scenic stop along the argan road. The romantic way to arrive.', ARRAY['luxury', 'champagne', 'leather-seats', 'scenic-stop', 'air-conditioning'], 'per_trip', 'https://images.unsplash.com/photo-1606664515524-ed2f786a0bd6?w=400', true)
ON CONFLICT (id) DO NOTHING;

-- ═══════════════════════════════════════════════
-- MARRAKECH PROPOSALS TRANSPORTS
-- ═══════════════════════════════════════════════

INSERT INTO transports (id, destination_id, name, type, provider, price, duration, description, features, pricing_unit, main_image_url, is_active) VALUES
('mkch-private', 'marrakech', 'Private Airport Transfer', 'private_car', 'Marrakech Romance Transfers', 45, '30 min', 'Private car transfer from Marrakech Menara airport to your riad. Meet & greet at arrivals with a name sign and chilled water.', ARRAY['private', 'meet-and-greet', 'air-conditioning', 'water'], 'per_trip', 'https://images.unsplash.com/photo-1606664515524-ed2f786a0bd6?w=400', true),
('mkch-luxury', 'marrakech', 'Luxury Range Rover Transfer', 'luxury_car', 'Marrakech Romance Transfers', 95, '30 min', 'Arrive in style in a Range Rover with rose petals on the seats, chilled champagne, and a personal driver who doubles as a city concierge.', ARRAY['luxury', 'champagne', 'rose-petals', 'meet-and-greet', 'air-conditioning'], 'per_trip', 'https://images.unsplash.com/photo-1606664515524-ed2f786a0bd6?w=400', true)
ON CONFLICT (id) DO NOTHING;
