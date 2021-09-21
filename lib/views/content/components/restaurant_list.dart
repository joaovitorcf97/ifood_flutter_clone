import 'package:flutter/material.dart';
import 'package:ifood_flutter_clone/core/theme/app_icons.dart';
import 'package:ifood_flutter_clone/core/theme/app_typography.dart';
import 'package:ifood_flutter_clone/models/restaurant.dart';

List<Restaurant> restaurants = [
  Restaurant(
    category: 'Japonesa',
    deliveryTaxe: 'R\$ 80,00',
    distance: '4,1 km',
    favorite: false,
    name: 'Restaurante Japones',
    photoUrl:
        'https://www.casamagalhaes.com.br/blog/wp-content/uploads/2019/01/Os-cuidados-no-manuseio-de-alimentos-em-restaurante-japon%C3%AAs-e1548856912626.jpg',
    rate: 4.6,
    time: [60, 80],
  ),
  Restaurant(
    category: 'Japonesa',
    deliveryTaxe: 'R\$ 80,00',
    distance: '4,1 km',
    favorite: false,
    name: 'Restaurante Japones',
    photoUrl:
        'https://www.casamagalhaes.com.br/blog/wp-content/uploads/2019/01/Os-cuidados-no-manuseio-de-alimentos-em-restaurante-japon%C3%AAs-e1548856912626.jpg',
    rate: 4.6,
    time: [60, 80],
  ),
  Restaurant(
    category: 'Japonesa',
    deliveryTaxe: 'R\$ 80,00',
    distance: '4,1 km',
    favorite: false,
    name: 'Restaurante Japones',
    photoUrl:
        'https://www.casamagalhaes.com.br/blog/wp-content/uploads/2019/01/Os-cuidados-no-manuseio-de-alimentos-em-restaurante-japon%C3%AAs-e1548856912626.jpg',
    rate: 4.6,
    time: [60, 80],
  ),
  Restaurant(
    category: 'Japonesa',
    deliveryTaxe: 'R\$ 80,00',
    distance: '4,1 km',
    favorite: false,
    name: 'Restaurante Japones',
    photoUrl:
        'https://www.casamagalhaes.com.br/blog/wp-content/uploads/2019/01/Os-cuidados-no-manuseio-de-alimentos-em-restaurante-japon%C3%AAs-e1548856912626.jpg',
    rate: 4.6,
    time: [60, 80],
  ),
  Restaurant(
    category: 'Japonesa',
    deliveryTaxe: 'R\$ 80,00',
    distance: '4,1 km',
    favorite: false,
    name: 'Restaurante Japones',
    photoUrl:
        'https://www.casamagalhaes.com.br/blog/wp-content/uploads/2019/01/Os-cuidados-no-manuseio-de-alimentos-em-restaurante-japon%C3%AAs-e1548856912626.jpg',
    rate: 4.6,
    time: [60, 80],
  ),
  Restaurant(
    category: 'Japonesa',
    deliveryTaxe: 'R\$ 80,00',
    distance: '4,1 km',
    favorite: false,
    name: 'Restaurante Japones',
    photoUrl:
        'https://www.casamagalhaes.com.br/blog/wp-content/uploads/2019/01/Os-cuidados-no-manuseio-de-alimentos-em-restaurante-japon%C3%AAs-e1548856912626.jpg',
    rate: 4.6,
    time: [60, 80],
  ),
  Restaurant(
    category: 'Japonesa',
    deliveryTaxe: 'R\$ 80,00',
    distance: '4,1 km',
    favorite: false,
    name: 'Restaurante Japones',
    photoUrl:
        'https://www.casamagalhaes.com.br/blog/wp-content/uploads/2019/01/Os-cuidados-no-manuseio-de-alimentos-em-restaurante-japon%C3%AAs-e1548856912626.jpg',
    rate: 4.6,
    time: [60, 80],
  ),
  Restaurant(
    category: 'Japonesa',
    deliveryTaxe: 'R\$ 80,00',
    distance: '4,1 km',
    favorite: false,
    name: 'Restaurante Japones',
    photoUrl:
        'https://www.casamagalhaes.com.br/blog/wp-content/uploads/2019/01/Os-cuidados-no-manuseio-de-alimentos-em-restaurante-japon%C3%AAs-e1548856912626.jpg',
    rate: 4.6,
    time: [60, 80],
  ),
];

class RestaurantItemComponent extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantItemComponent({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  restaurant.photoUrl,
                ),
                radius: 30,
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: AppTypography.restaurantTitle(context),
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      AppIcon(
                        icon: AppIcons.star,
                        size: Size(12, 12),
                        color: Colors.amber,
                      ),
                      SizedBox(width: 4),
                      Text(
                        restaurant.rate.toString(),
                        style: AppTypography.restaurantDetails(context).copyWith(
                          color: Colors.amber,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        '•',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        restaurant.category,
                        style: AppTypography.restaurantDetails(context),
                      ),
                      SizedBox(width: 4),
                      Text(
                        '•',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        restaurant.distance,
                        style: AppTypography.restaurantDetails(context),
                      ),
                    ],
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      Text(
                        restaurant.time[0].toString(),
                        style: AppTypography.restaurantDetails(context),
                      ),
                      SizedBox(width: 4),
                      Text('-'),
                      SizedBox(width: 4),
                      Text(
                        restaurant.time[1].toString(),
                        style: AppTypography.restaurantDetails(context),
                      ),
                      SizedBox(width: 4),
                      Text(
                        '•',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        restaurant.deliveryTaxe,
                        style: AppTypography.restaurantDetails(context),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          AppIcon(
            icon: AppIcons.favLine,
            size: Size(18, 18),
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
