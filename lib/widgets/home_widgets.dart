part of '../main.dart';

class FeatureTile extends StatelessWidget {
const FeatureTile({
super.key,
required this.icon,
required this.title,
required this.subtitle,
this.onTap,
});

final IconData icon;
final String title;
final String subtitle;
final VoidCallback? onTap;

@override
Widget build(BuildContext context) {
return Card(
child: ListTile(
onTap: onTap,
leading: Icon(
icon,
color: const Color(0xFF14243A),
size: 28,
),
title: Text(
title,
style: const TextStyle(fontWeight: FontWeight.w600),
),
subtitle: Text(subtitle),
trailing: const Icon(Icons.arrow_forward_ios, size: 15),
),
);
}
}

class SectionHeading extends StatelessWidget {
const SectionHeading(this.title, {super.key});

final String title;

@override
Widget build(BuildContext context) => Text(
title,
style: const TextStyle(
fontSize: 19,
fontWeight: FontWeight.bold,
),
);
}

void _showComingSoon(BuildContext context, String feature) {
ScaffoldMessenger.of(context).showSnackBar(
SnackBar(content: Text('$feature: módulo en desarrollo.')),
);
}

class HomeBannerAd extends StatefulWidget {
const HomeBannerAd({super.key});

@override
State<HomeBannerAd> createState() => _HomeBannerAdState();
}

class _HomeBannerAdState extends State<HomeBannerAd> {
BannerAd? _bannerAd;
bool _isLoaded = false;

// ID de prueba de Google.
// Sustituir por el ID real cuando la aplicación esté lista.
static const String _testAdUnitId =
'ca-app-pub-3940256099942544/6300978111';

void _loadBanner() {
final banner = BannerAd(
adUnitId: _testAdUnitId,
size: AdSize.banner,
request: const AdRequest(),
listener: BannerAdListener(
onAdLoaded: (ad) {
if (!mounted) {
ad.dispose();
return;
}

setState(() {
_bannerAd = ad as BannerAd;
_isLoaded = true;
});
},
onAdFailedToLoad: (ad, error) {
ad.dispose();
},
),
);

banner.load();
}

@override
void initState() {
super.initState();
_loadBanner();
}

@override
void dispose() {
_bannerAd?.dispose();
super.dispose();
}

@override
Widget build(BuildContext context) {
if (!_isLoaded || _bannerAd == null) {
return const SizedBox.shrink();
}

return Container(
alignment: Alignment.center,
width: double.infinity,
height: _bannerAd!.size.height.toDouble(),
child: AdWidget(ad: _bannerAd!),
);
}
}
