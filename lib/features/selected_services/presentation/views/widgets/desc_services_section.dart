import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/features/services/data/models/get_service_model/service.dart';

class DescServicesSection extends StatelessWidget {
  const DescServicesSection({Key? key, required this.service})
      : super(key: key);
  final Service service;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Text(
              'Description : ',
              style: TextStyle(
                color: kLogoColor,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          
        
        Text(
          'Service Category:   ${service.serviceCategory!}',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 5),
         Text(
          'Descriprion:  ${service.description!}',
          style:const TextStyle(
            
            color: kLogoColor,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 10),
        Text(
          'Address:  ${service.address}',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 10),
         Text(
          'Price:  ${service.price}',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 10),
         Text(
          'Name:  ${service.userId!.name!}',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 10),
          Text(
          'Phone:  ${service.userId!.phoneNumber!}',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 10),
         Text(
          'Email:  ${service.userId!.email!}',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 10),
          Text(
          'Status:  ${service.userId!.status!}',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 10),

      ],
    );
  }
}
