import 'package:sanskar_pg_app/models/address/address.dart';
import 'package:sanskar_pg_app/models/event/event.dart';


List<Event> events = [
  Event(
      startingTime: DateTime.now(),
      eventId: '1',
      hostelId: '1',
      eventTitle: 'Fresher\'s Party',
      endingDate: DateTime.now().add(const Duration(days: 2)),
      startingDate: DateTime.now(),
      eventImage:
          'https://images.unsplash.com/photo-1516450360452-9312f5e86fc7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
      address: Address(
          street: 'Block No. 5, Studio Apartments Near GH - 0, Infocity',
          pinCode: '382350',
          city: 'Gandhinagar',
          state: 'Gujrat'),
      endingTime: DateTime.now().add(const Duration(hours: 2))),
  Event(
      startingTime: DateTime.now(),
      eventTitle: 'Fresher\'s Party',
      eventId: '2',
      hostelId: '1',
      endingDate: DateTime.now().add(const Duration(days: 2)),
      startingDate: DateTime.now(),
      eventImage:
          'https://images.unsplash.com/photo-1533174072545-7a4b6ad7a6c3?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cGFydHl8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      address: Address(
          street: 'Block No. 5, Studio Apartments Near GH - 0, Infocity',
          pinCode: '382350',
          city: 'Gandhinagar',
          state: 'Gujrat'),
      endingTime: DateTime.now().add(const Duration(hours: 2))),
  Event(
      startingTime: DateTime.now(),
      eventId: '3',
      hostelId: '1',
      eventTitle: 'Fresher\'s Party',
      endingDate: DateTime.now().subtract(const Duration(days: 1)),
      startingDate: DateTime.now().subtract(const Duration(days: 2)),
      eventImage:
          'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
      address: Address(
          street: 'Block No. 5, Studio Apartments Near GH - 0, Infocity',
          pinCode: '382350',
          city: 'Gandhinagar',
          state: 'Gujrat'),
      endingTime: DateTime.now().add(const Duration(hours: 2))),
  Event(
      startingTime: DateTime.now(),
      eventId: '4',
      hostelId: '1',
      eventTitle: 'Singing Event',
      endingDate: DateTime.now().subtract(const Duration(days: 1)),
      startingDate: DateTime.now().subtract(const Duration(days: 2)),
      eventImage:
          'https://images.unsplash.com/photo-1460723237483-7a6dc9d0b212?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
      address: Address(
          street: 'Block No. 5, Studio Apartments Near GH - 0, Infocity',
          pinCode: '382350',
          city: 'Gandhinagar',
          state: 'Gujrat'),
      endingTime: DateTime.now().add(const Duration(hours: 2))),
  Event(
      startingTime: DateTime.now(),
      eventId: '5',
      eventTitle: 'Drawing Competition',
      hostelId: '1',
      endingDate: DateTime.now().subtract(const Duration(days: 1)),
      startingDate: DateTime.now().subtract(const Duration(days: 2)),
      eventImage:
          'https://images.unsplash.com/photo-1599505535258-a901cc525b5f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTR8fGRyYXdpbmd8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      address: Address(
          street: 'Block No. 5, Studio Apartments Near GH - 0, Infocity',
          pinCode: '382350',
          city: 'Gandhinagar',
          state: 'Gujrat'),
      endingTime: DateTime.now().add(const Duration(hours: 2))),
  Event(
      startingTime: DateTime.now(),
      eventId: '6',
      hostelId: '1',
      eventTitle: 'Drawing Competition',
      endingDate: DateTime.now().subtract(const Duration(days: 1)),
      startingDate: DateTime.now().subtract(const Duration(days: 2)),
      eventImage:
          'https://images.unsplash.com/photo-1550026593-cb89847b168d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1050&q=80',
      address: Address(
          street: 'Block No. 5, Studio Apartments Near GH - 0, Infocity',
          pinCode: '382350',
          city: 'Gandhinagar',
          state: 'Gujrat'),
      endingTime: DateTime.now().add(const Duration(hours: 2))),
  Event(
      startingTime: DateTime.now(),
      eventId: '7',
      hostelId: '1',
      eventTitle: 'Drawing Competition',
      endingDate: DateTime.now().subtract(const Duration(days: 1)),
      startingDate: DateTime.now().subtract(const Duration(days: 2)),
      eventImage:
          'https://images.unsplash.com/photo-1504455510213-fb155b64f3fb?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=967&q=80',
      address: Address(
          street: 'Block No. 5, Studio Apartments Near GH - 0, Infocity',
          pinCode: '382350',
          city: 'Gandhinagar',
          state: 'Gujrat'),
      endingTime: DateTime.now().add(const Duration(hours: 2))),
  Event(
      startingTime: DateTime.now(),
      eventId: '8',
      hostelId: '1',
      eventTitle: 'Fresher\'s Party',
      endingDate: DateTime.now().add(const Duration(days: 2)),
      startingDate: DateTime.now().add(const Duration(days: 1)),
      eventImage:
          'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
      address: Address(
          street: 'Block No. 5, Studio Apartments Near GH - 0, Infocity',
          pinCode: '382350',
          city: 'Gandhinagar',
          state: 'Gujrat'),
      endingTime: DateTime.now().add(const Duration(hours: 2))),
  Event(
      startingTime: DateTime.now(),
      eventId: '9',
      hostelId: '1',
      eventTitle: 'Singing Event',
      endingDate: DateTime.now().add(const Duration(days: 2)),
      startingDate: DateTime.now().add(const Duration(days: 1)),
      eventImage:
          'https://images.unsplash.com/photo-1460723237483-7a6dc9d0b212?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
      address: Address(
          street: 'Block No. 5, Studio Apartments Near GH - 0, Infocity',
          pinCode: '382350',
          city: 'Gandhinagar',
          state: 'Gujrat'),
      endingTime: DateTime.now().add(const Duration(hours: 2))),
  Event(
      startingTime: DateTime.now(),
      eventId: '10',
      hostelId: '1',
      eventTitle: 'Drawing Competition',
      endingDate: DateTime.now().add(const Duration(days: 2)),
      startingDate: DateTime.now().add(const Duration(days: 1)),
      eventImage:
          'https://images.unsplash.com/photo-1599505535258-a901cc525b5f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTR8fGRyYXdpbmd8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      address: Address(
          street: 'Block No. 5, Studio Apartments Near GH - 0, Infocity',
          pinCode: '382350',
          city: 'Gandhinagar',
          state: 'Gujrat'),
      endingTime: DateTime.now().add(const Duration(hours: 2))),
  Event(
      startingTime: DateTime.now(),
      eventId: '11',
      hostelId: '1',
      eventTitle: 'Drawing Competition',
      endingDate: DateTime.now().add(const Duration(days: 2)),
      startingDate: DateTime.now().add(const Duration(days: 1)),
      eventImage:
          'https://images.unsplash.com/photo-1550026593-cb89847b168d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1050&q=80',
      address: Address(
          street: 'Block No. 5, Studio Apartments Near GH - 0, Infocity',
          pinCode: '382350',
          city: 'Gandhinagar',
          state: 'Gujrat'),
      endingTime: DateTime.now().add(const Duration(hours: 2))),
  Event(
      startingTime: DateTime.now(),
      eventId: '12',
      hostelId: '1',
      eventTitle: 'Drawing Competition',
      endingDate: DateTime.now().add(const Duration(days: 2)),
      startingDate: DateTime.now().add(const Duration(days: 1)),
      eventImage:
          'https://images.unsplash.com/photo-1504455510213-fb155b64f3fb?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=967&q=80',
      address: Address(
          street: 'Block No. 5, Studio Apartments Near GH - 0, Infocity',
          pinCode: '382350',
          city: 'Gandhinagar',
          state: 'Gujrat'),
      endingTime: DateTime.now().add(const Duration(hours: 2))),
];
