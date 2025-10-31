
import '../../gen/assets.gen.dart';
import '../../models/onboarding_page_model.dart';

class ConstData{
static final page1 =   OnboardingPageModel(
  image: Assets.images.on1.path ,
  title: 'Find Your Next Favorite Movie Here',
  description:
  'Get access to a huge library of movies to suit all tastes. You will surely like it.',
  buttonText: 'Explore Now',
);
 static final List<OnboardingPageModel> pages = [
    OnboardingPageModel(
      image: Assets.images.on2.path,
      title: 'Discover Movies',
      description:
      'Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.',
      buttonText: 'Next',
    ),
    OnboardingPageModel(
      image: Assets.images.on3.path,
      title: 'Explore All Genres',
      description:
      'Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.',
      buttonText: 'Next',
    ),
    OnboardingPageModel(
      image: Assets.images.on4.path,
      title: 'Create Watchlist',
      description:
      'Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.',
      buttonText: 'Next',
    ),
    OnboardingPageModel(
      image: Assets.images.on5.path,
      title: 'Rate, Review, and Learn',
      description:
      'Share your thoughts on the movies you have watched. Dive deep into film details and help others discover great movies with your reviews.',
      buttonText: 'Next',
    ),
    OnboardingPageModel(
      image:Assets.images.on6.path,
      title: 'Start Watching Now',
      description: '',
      buttonText: 'Finish',
    ),
  ];

}