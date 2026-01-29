import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isEntreeChecked = false;
  bool isSortieChecked = false;

  String today =
      "${DateTime.now().day.toString().padLeft(2, '0')}/"
      "${DateTime.now().month.toString().padLeft(2, '0')}/"
      "${DateTime.now().year}";

  DateTime? selectedDate;

  // Variables séparées pour chaque champ
  String adresseLogement = '';
  String nouvelleAdresseLigne2 = '';
  String electricite = '';
  String gaz = '';
  String eau = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 18.0,
        title: Column(
          children: const [
            Text(
              'État des lieux',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'Loi n°89-462 du 6 juillet 1989 relative aux rapports locatifs',
              style: TextStyle(fontSize: 12.0),
            ),
          ],
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          Card(
            elevation: 0.0,
            child: Row(
              children: [
                Expanded(
                  child: CheckboxListTile(
                    controlAffinity: ListTileControlAffinity
                        .leading, // Pour placer la case à cocher à gauche
                    title: const Text('Entrée'),
                    subtitle: InkWell(
                      // Pour rendre le texte cliquable
                      onTap: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: selectedDate ?? DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (picked != null) {
                          setState(() {
                            selectedDate = picked;
                          });
                        }
                      },
                      child: Text(
                        selectedDate != null
                            ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
                            : '$today',
                        style: const TextStyle(color: Colors.blue),
                      ),
                    ),
                    value: isEntreeChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isEntreeChecked = value!;
                        if (value) {
                          isSortieChecked = false;
                        }
                        ;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text('Sortie'),
                    subtitle: InkWell(
                      // Pour rendre le texte cliquable
                      onTap: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: selectedDate ?? DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (picked != null) {
                          setState(() {
                            selectedDate = picked;
                          });
                        }
                      },
                      child: Text(
                        selectedDate != null
                            ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
                            : '$today',
                        style: const TextStyle(color: Colors.blue),
                      ),
                    ),
                    value: isSortieChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isSortieChecked = value!;
                        if (value) {
                          isEntreeChecked = false;
                        }
                        ;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),

          Text(
            'Adresse du logement :',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          TextField(
            onChanged: (value) {
              setState(() {
                adresseLogement = value;
              });
            },
          ),
          Text(
            '''L’état des lieux doit être établi de façon contradictoire entre les deux parties lors de la remise des clés au locataire et lors de leur restitution en fin de bail, conformément à l’article 3 de la Loi n°89-462 du 6 juillet 1989. Il fait partie du contrat de location, dont il ne peut être dissocié. L’état des lieux d’entrée peut être complété par le locataire dans les 10 jours suivant sa tenue (et pendant le 1er mois de chauffe pour les éléments de chauffage).''',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 11.0),
          ),
          SizedBox(height: 16.0),

          Text(
            'Le bailleur ou son représentant :',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 2.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 0.0),
                child: Text('Nom :', style: TextStyle(fontSize: 14.0)),
              ),
              SizedBox(width: 6.0),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 1.0),
                    isDense: true,
                  ),
                  onChanged: (value) {
                    setState(() {
                      adresseLogement = value;
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 0.0),
                child: Text('Domicile :', style: TextStyle(fontSize: 14.0)),
              ),
              SizedBox(width: 6.0),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 1.0),
                    isDense: true,
                  ),
                  onChanged: (value) {
                    setState(() {
                      adresseLogement = value;
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),

          Center(
            child: Text(
              'et',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 2.0),

          Text(
            'Le locataire :',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 2.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 0.0),
                child: Text('Nom :', style: TextStyle(fontSize: 14.0)),
              ),
              SizedBox(width: 6.0),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 1.0),
                    isDense: true,
                  ),
                  onChanged: (value) {
                    setState(() {
                      adresseLogement = value;
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 0.0),
                child: Text(
                  'Si état de lieu de sortie, nouvelle adresse :',
                  style: TextStyle(fontSize: 14.0),
                ),
              ),
              SizedBox(width: 6.0),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 1.0),
                    isDense: true,
                  ),
                  onChanged: (value) {
                    setState(() {
                      adresseLogement = value;
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(width: 6.0), // Pour aligner avec le champ au-dessus
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 1.0),
                    isDense: true,
                  ),
                  onChanged: (value) {
                    setState(() {
                      // Utilisez une nouvelle variable si nécessaire
                      nouvelleAdresseLigne2 = value;
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 45.0),

          Text(
            'Identification compteurs et relèves',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.0),

          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              hintText: 'Relève',
              labelText: 'Electricité',
              prefixIcon: Icon(Icons.flash_on),
            ),
            onChanged: (value) {
              setState(() {
                electricite = value;
              });
            },
          ),
          SizedBox(height: 16.0),

          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              hintText: 'Relève',
              labelText: 'Gaz',
              prefixIcon: Icon(Icons.fireplace),
            ),
            onChanged: (value) {
              setState(() {
                gaz = value;
              });
            },
          ),
          SizedBox(height: 16.0),

          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              hintText: 'Relève',
              labelText: 'Eau',
              prefixIcon: Icon(Icons.water),
            ),
            onChanged: (value) {
              setState(() {
                eau = value;
              });
            },
          ),
          SizedBox(height: 16.0),

          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              hintText: 'N° fibre',
              labelText: 'Internet',
              prefixIcon: Icon(Icons.wifi),
            ),
            onChanged: (value) {
              setState(() {
                eau = value;
              });
            },
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
