import 'package:flutter/material.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vgan,
}

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.currentFilter});
  final Map<Filter, bool> currentFilter;
  @override
  State<FilterScreen> createState() {
    return _FiltrScreenState();
  }
}

class _FiltrScreenState extends State<FilterScreen> {
  var _gluternFreeSet = false;
  var _lactoseFreeSet = false;
  var _vagitarianSet = false;
  var _veganSet = false;

  @override
  void initState() {
    super.initState();
    _gluternFreeSet = widget.currentFilter[Filter.glutenFree]!;
    _lactoseFreeSet = widget.currentFilter[Filter.lactoseFree]!;
    _vagitarianSet = widget.currentFilter[Filter.vegetarian]!;
    _veganSet = widget.currentFilter[Filter.vgan]!;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop({
          Filter.glutenFree: _gluternFreeSet,
          Filter.lactoseFree: _lactoseFreeSet,
          Filter.vegetarian: _vagitarianSet,
          Filter.vgan: _veganSet,
        });
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Filters Screen'),
        ),
        // drawer: MainDrawer(onSelectScreen: (identifier) {
        //   if (identifier == 'meals') {
        //     Navigator.of(context).pushReplacement(
        //       MaterialPageRoute(
        //         builder: (ctx) => const TabsScreen(),
        //       ),
        //     );
        //   }
        // }),
        body: Column(children: [
          SwitchListTile(
            value: _gluternFreeSet,
            onChanged: (getChechked) {
              setState(() {
                _gluternFreeSet = getChechked;
              });
            },
            title: Text(
              'Gluten-Free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only include gluten-free meals.',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: _lactoseFreeSet,
            onChanged: (getChechked) {
              setState(() {
                _lactoseFreeSet = getChechked;
              });
            },
            title: Text(
              'Lactose-Free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only include Lactose-free meals.',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: _vagitarianSet,
            onChanged: (getChechked) {
              setState(() {
                _vagitarianSet = getChechked;
              });
            },
            title: Text(
              'Vegitarian',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only include vegitarian meals.',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: _veganSet,
            onChanged: (getChechked) {
              setState(() {
                _veganSet = getChechked;
              });
            },
            title: Text(
              'Vegan',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only include vegan meals.',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
        ]),
      ),
    );
  }
}
