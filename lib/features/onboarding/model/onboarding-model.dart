class OnboardingModel {
final String Image;
final String title;
final String description;

  OnboardingModel({required this.Image, required this.title, required this.description});
static List<OnboardingModel>onboardingList=[
OnboardingModel(Image: 'assets/img/onboarding1.png', title: 'Trending News', description: 'Stay in the loop with the biggest breaking stories in a stunning visual slider. Just swipe to explore what’s trending right now!'),
OnboardingModel(Image: 'assets/img/onboarding2.png', title: 'Pick What You Love', description: 'No more endless scrolling! Tap into your favorite topics like Tech, Politics, or Sports and get personalized news in seconds'),
OnboardingModel(Image: 'assets/img/onboarding3.png', title: 'Save It. Read It Later. Stay Smart.', description: 'Found something interesting? Tap the bookmark and come back to it anytime. Never lose a great read again!')


];
}