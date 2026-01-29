/// Modèle de données pour l'état des lieux
class EtatDesLieuxModel {
  // Type d'état des lieux
  bool isEntree;
  DateTime? dateEntree;
  DateTime? dateSortie;

  // Informations du logement
  String adresseLogement;

  // Informations du bailleur
  String nomBailleur;
  String domicileBailleur;

  // Informations du locataire
  String nomLocataire;
  String nouvelleAdresse;
  String nouvelleAdresseLigne2;

  // Compteurs
  String releveElectricite;
  String releveGaz;
  String releveEau;
  String numeroFibre;

  EtatDesLieuxModel({
    this.isEntree = false,
    this.dateEntree,
    this.dateSortie,
    this.adresseLogement = '',
    this.nomBailleur = '',
    this.domicileBailleur = '',
    this.nomLocataire = '',
    this.nouvelleAdresse = '',
    this.nouvelleAdresseLigne2 = '',
    this.releveElectricite = '',
    this.releveGaz = '',
    this.releveEau = '',
    this.numeroFibre = '',
  });

  /// Copie le modèle avec de nouvelles valeurs
  EtatDesLieuxModel copyWith({
    bool? isEntree,
    DateTime? dateEntree,
    DateTime? dateSortie,
    String? adresseLogement,
    String? nomBailleur,
    String? domicileBailleur,
    String? nomLocataire,
    String? nouvelleAdresse,
    String? nouvelleAdresseLigne2,
    String? releveElectricite,
    String? releveGaz,
    String? releveEau,
    String? numeroFibre,
  }) {
    return EtatDesLieuxModel(
      isEntree: isEntree ?? this.isEntree,
      dateEntree: dateEntree ?? this.dateEntree,
      dateSortie: dateSortie ?? this.dateSortie,
      adresseLogement: adresseLogement ?? this.adresseLogement,
      nomBailleur: nomBailleur ?? this.nomBailleur,
      domicileBailleur: domicileBailleur ?? this.domicileBailleur,
      nomLocataire: nomLocataire ?? this.nomLocataire,
      nouvelleAdresse: nouvelleAdresse ?? this.nouvelleAdresse,
      nouvelleAdresseLigne2: nouvelleAdresseLigne2 ?? this.nouvelleAdresseLigne2,
      releveElectricite: releveElectricite ?? this.releveElectricite,
      releveGaz: releveGaz ?? this.releveGaz,
      releveEau: releveEau ?? this.releveEau,
      numeroFibre: numeroFibre ?? this.numeroFibre,
    );
  }
}
