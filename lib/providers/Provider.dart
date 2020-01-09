import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:flutter_tts/flutter_tts.dart';

class classProvider with ChangeNotifier {

  List<Widget> getLocationTime(
      BuildContext context, String location, String time) {
    Future _succesBooking(BuildContext context) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text("Succes!"),
              content: new Text("Your room is booked succesfully"),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                new FlatButton(
                  child: new Text("ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }

    List rdm = [];

    for (int i = 0; i < 6; i++) {
      rdm.add(Random.secure().nextInt(20));
    }

    return [
      Card(
        child: ListTile(
          title: Text('room ${location} in hk2501'),
          leading: Container(
            width: 40,
            child: Row(
              children: <Widget>[
                Text(Random.secure().nextInt(20).toString()),
                Icon(Icons.airline_seat_legroom_normal),
              ],
            ),
          ),
          subtitle: Text('available from 12.00 till 13.00 '),
          onTap: () {
            return _succesBooking(context);
          },
        ),
      ),
      Card(
        child: ListTile(
          title: Text('room ${location} in vf23010'),
          leading: Container(
            width: 40,
            child: Row(
              children: <Widget>[
                Text(Random.secure().nextInt(20).toString()),
                Icon(Icons.airline_seat_legroom_normal),
              ],
            ),
          ),
          subtitle: Text('available from 12.00 till 13.00'),
          onTap: () {
            return _succesBooking(context);
          },
        ),
      ),
      Card(
        child: ListTile(
          title: Text('room ${location} in hk2301'),
          leading: Container(
            width: 40,
            child: Row(
              children: <Widget>[
                Text(Random.secure().nextInt(20).toString()),
                Icon(Icons.airline_seat_legroom_normal),
              ],
            ),
          ),
          subtitle: Text('available from 14.00 till 18.00'),
          onTap: () {
            return _succesBooking(context);
          },
        ),
      ),
      Card(
        child: ListTile(
          title: Text('room ${location} in RK1010'),
          leading: Container(
            width: 40,
            child: Row(
              children: <Widget>[
                Text(Random.secure().nextInt(20).toString()),
                Icon(Icons.airline_seat_legroom_normal),
              ],
            ),
          ),
          subtitle: Text('available from 9.00 till 20.00'),
          onTap: () {
            return _succesBooking(context);
          },
        ),
      ),
      Card(
        child: ListTile(
          title: Text('room ${location} in G103'),
          leading: Container(
            width: 40,
            child: Row(
              children: <Widget>[
                Text(Random.secure().nextInt(20).toString()),
                Icon(Icons.airline_seat_legroom_normal),
              ],
            ),
          ),
          subtitle: Text('available from 12.30 till 15.00'),
          onTap: () {
            return _succesBooking(context);
          },
        ),
      ),
    ];
  }

  get getEvents {
    return [
      [
        'title1',
        ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec condimentum pharetra leo, id hendrerit tortor ultrices a. Sed convallis nulla sed magna sodales dictum.',
        'assets/background.jpg',
      ],
      [
        'title2',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec condimentum pharetra leo, id hendrerit tortor ultrices a. Sed convallis nulla sed magna sodales dictum.',
        'assets/background.jpg',
      ],
      [
        'title3',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec condimentum pharetra leo, id hendrerit tortor ultrices a. Sed convallis nulla sed magna sodales dictum.',
        'assets/background.jpg',
      ],
    ];
  }

  final SpeechToText speech = SpeechToText();
  final FlutterTts flutterTts = FlutterTts();


  void resultListener(SpeechRecognitionResult result, BuildContext context) async {
    String lastWords = "${result.recognizedWords}";
    print(lastWords);

    if (result.finalResult == true && speech.hasRecognized) {
      speech.stop();
      Navigator.pop(context);
      List wordList = lastWords.toLowerCase().split(" ");
      print(wordList);

      if((wordList.contains('boek') || wordList.contains('kamer') || wordList.contains('room')) && (wordList.contains('vrijhof') || wordList.contains('waaier') || wordList.contains('ravelijn') || wordList.contains('technohal'))) {
        String location;
        int roomNumber = Random.secure().nextInt(4000);



        for(String word in wordList) {
          switch (word) {
            case 'vrijhof': {
              location = 'vrijhof';
            }
            break;
            case 'waaier': {
              location = 'waaier';
            }
            break;
            case 'ravelijn': {
              location = 'ravelijn';
            }
            break;
            case 'technohal': {
              location = 'technohal';
            }
            break;
          }

        }

        if(wordList.contains('room')){
          await flutterTts.setLanguage("en-US");
          await flutterTts.speak('there has been a room booked at 12 in the ${location}, room vr${roomNumber}');
        } else {
          await flutterTts.setLanguage("nl");
          await flutterTts.speak('er is voor morgen een kamer om 12 uur geboekt in  de ${location}, kamer vr${roomNumber}');
        }
      } else if(wordList.contains('les') || wordList.contains('lecture')){
        int time = Random.secure().nextInt(18);

        if(wordList.contains('lecture')){
          await flutterTts.setLanguage("en-US");
          await flutterTts.speak('your next lecture is tomorrow at ${time} o clock in waaier 1');
        } else {
          await flutterTts.setLanguage("nl");
          await flutterTts.speak('je volgende les is morgen om ${time} uur in waaier 1');
        }

      }

    }
  }

  Future listenToUser(BuildContext context) async {
    bool available = await speech.initialize();
    if (available) {
      speech.listen(
        listenFor: Duration(seconds: 10),
        onResult: (result){
          resultListener(result, context);
        },
      );
    } else {
      print("The user has denied the use of speech recognition.");
    }
  }

  Future stopListening(BuildContext context){
    speech.stop();
  }

  Future cancelListening(BuildContext context){
    speech.cancel();
  }

}
