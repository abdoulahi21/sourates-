import 'package:flutter/material.dart';
import 'package:sourates/model/Duas.dart';
import 'package:sourates/style/style.dart';
import 'package:sourates/views/duas_details_view.dart';

class ListesDuas extends StatefulWidget {
  @override
  _ListesDuasState createState() => _ListesDuasState();
}

class _ListesDuasState extends State<ListesDuas> {
  String selectedCategory = "Tous";

  List<String> categories = getCategories();
  
  List<Duas> getFilteredDuas() {
    if (selectedCategory == "Tous") {
      return localDuas; // Correction ici
    } else {
      return localDuas
          .where((duas) => duas.category == selectedCategory)
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Duas> filteredDuas = getFilteredDuas();

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(title: Text('Liste des Duas', style: titleGreenStyle()),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        actions: [
          CircleAvatar(
            backgroundColor: blueColor,
            backgroundImage: AssetImage(
              "assets/icons/prayer.png",
            ),
          )
        ],
      ),
      body: Column(
        children: [
          // Boutons de filtre des catégories
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: categories.map((category) {
                bool isSelected = category == selectedCategory;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.teal : Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        category,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          // Liste des Duas filtrés
          Expanded(
            child: filteredDuas.isEmpty
                ? Center(child: Text("Aucun Dua dans cette catégorie."))
                : ListView.builder(
                    itemCount: filteredDuas.length,
                    itemBuilder: (context, index) {
                      final duas = filteredDuas[index];
                      return Card(
                        margin: EdgeInsets.all(3),
                        child: ListTile(
                          title: Text('${duas.id}.   ' + duas.name, // Correction ici
                              style: titleGreenStyle()),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DuasDetailsView(duas: duas),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

// Exemple de liste locale des Duas
List<Duas> localDuas = [
  //category: "Matin"
  Duas(id: 1,
   name: "Lorsqu'on se réveille", 
   category: "Matin & Soir",
   arabe: "الحمد لله الذي أحيانا بعد ما أماتنا وإليه النشور",
   traduction: "Louange à Allah qui nous a fait revivre après nous avoir fait mourir et c’est vers Lui que nous ressusciterons",
  ),
  Duas(id: 18,
   name: "Du matin et du soir", 
   category: "Matin & Soir",
   arabe: "اللهم بك أصبحنا وبك أمسينا وبك نحيا وبك نموت وإليك النشور",
   traduction: "O Allah, c’est par Toi que nous atteignons le matin et par Toi que nous atteignons le soir, par Toi que nous vivons et par Toi que nous mourons, et vers Toi est la résurrection",
  ),
  Duas(id: 19,
   name: "Du sommeil", 
   category: "Matin & Soir",
   arabe: "بِاسْمِكَ اللَّهُمَّ أَمُوتُ وَأَحْيَا",
   traduction: "En Ton nom, ô Allah, je meurs et je vis",
  ),
  Duas(id: 20,
   name: "Lorsque l'on change de côté en dormant", 
   category: "Matin & Soir",
   arabe: "لا إِلَهَ إِلاَّ اللَّهُ وَحْدَهُ لا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ",
   traduction: "Il n’y a de divinité digne d’adoration qu’Allah, l’Unique, sans associé, à Lui appartient la royauté et à Lui revient la louange, et Il est capable de toute chose",
  ),
  Duas(id: 21,
   name: "Du réveil", 
   category: "Matin & Soir",
   arabe: "الحمد لله الذي أحيانا بعد ما أماتنا وإليه النشور",
   traduction: "Louange à Allah qui nous a fait revivre après nous avoir fait mourir et c’est vers Lui que nous ressusciterons",
  ),
  Duas(id: 22,
   name: "Du coucher", 
   category: "Matin & Soir",
   arabe: "اللَّهُمَّ بِاسْمِكَ أَمُوتُ وَأَحْيَا",
   traduction: "O Allah, en Ton nom je meurs et je vis",
  ),
  Duas(id: 2, 
  name: "Dua du soir", 
  category: "Matin & Soir",
  arabe: "اللهم بك أمسينا وبك أصبحنا وبك نحيا وبك نموت وإليك النشور",
  traduction: "O Allah, c’est en Toi que nous avons atteint le soir, et c’est en Toi que nous avons atteint le matin, et c’est en Toi que nous vivons, et c’est en Toi que nous mourrons",
  ),
  //category: "Maison & Famille"
  Duas(id: 23,
  category:"Maison & Famille",
  name: "Lorsque l'on met un vêtement neuf",
  arabe: "اللَّهُمَّ لَكَ الْحَمْدُ أَنْتَ كَسَوْتَنِيهِ أَسْأَلُكَ خَيْرَهُ وَخَيْرَ مَا صُنِعَ لَهُ وَأَعُوذُ بِكَ مِنْ شَرِّهِ وَشَرِّ مَا صُنِعَ لَهُ",
  traduction: "O Allah, à Toi la louange, c'est Toi qui m'as vêtu de ce vêtement, je Te demande son bien et le bien pour lequel il a été fait, et je me réfugie auprès de Toi contre son mal et le mal pour lequel il a été fait",
  ),
  Duas(id: 24,
  category:"Maison & Famille",
  name: "Lorsqu'on s'habille",
  arabe: "الْحَمْدُ لِلَّهِ الَّذِي كَسَانِي هَذَا (الثَّوْبَ) وَرَزَقَنِيهِ مِنْ غَيْرِ حَوْلٍ مِنِّي وَلَا قُوَّةٍ",
  traduction: "Louange à Allah qui m'a vêtu de ce (vêtement) et me l'a accordé sans force ni puissance de ma part",
  ),
  Duas(id: 25,
  category:"Maison & Famille",
  name: "Ce que l'on dit à celui qui met un vêtement neuf",
  arabe: "تُبْلِي وَيُخْلِفُ اللَّهُ تَعَالَى",
  traduction: "Puisse-tu l'user et qu'Allah le Très-Haut te le remplace",
  ),
  Duas(id: 26,
  category:"Maison & Famille",
  name: "Avant de se déshabiller",
  arabe: "بِسْمِ اللَّهِ",
  traduction: "Au nom d'Allah",
  ),
  Duas(id: 27,
  category:"Maison & Famille",
  name: "En entrant aux toilettes",
  arabe: "اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْخُبُثِ وَالْخَبَائِثِ",
  traduction: "O Allah, je me réfugie auprès de Toi contre les mauvais et les mauvaises choses",
  ),
  Duas(id: 28,
  category:"Maison & Famille",
  name: "En sortant des toilettes",
  arabe: "غُفْرَانَكَ",
  traduction: "Je demande Ton pardon",
  ),
  Duas(id: 29,
  category:"Maison & Famille",
  name: "En sortant de la maison",
  arabe: "بِسْمِ اللَّهِ تَوَكَّلْتُ عَلَى اللَّهِ وَلَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللَّهِ",
  traduction: "Au nom d'Allah, je place ma confiance en Allah, il n'y a de force ni de puissance qu'en Allah",
  ),
  Duas(id: 30,
  category:"Maison & Famille",
  name: "En entrant dans la maison",
  arabe: "بِسْمِ اللَّهِ وَلَجْنَا وَبِسْمِ اللَّهِ خَرَجْنَا وَعَلَى اللَّهِ رَبِّنَا تَوَكَّلْنَا",
  traduction:"Au nom d'Allah, nous entrons, au nom d'Allah, nous sortons, et notre Seigneur, c'est Allah, en Qui nous plaçons notre confiance",
  ),
  //category: "Prière",
  Duas(id: 5,
  category:"Prière",
  name: "Ce que l'on dit avant les ablutions",
  arabe: "بِسْمِ اللهِ",
  traduction: "Au nom d’Allah",
  ),
  Duas(id: 6,
  category:"Prière",
  name: "Ce que l'on dit apres les ablutions",
  arabe: "أَشْهَدُ أَنْ لا إِلَهَ إِلاّ اللهُ وَحْدَهُ لا شَرِيكَ لَهُ وَأَشْهَدُ أَنَّ مُحَمَّدًا عَبْدُهُ وَرَسُولُهُ",
  traduction: "J’atteste qu’il n’y a de divinité digne d’être adorée qu’Allah, l’Unique, sans associé, et j’atteste que Muhammad est Son serviteur et Son messager",
  ),
  Duas(id: 7,
  category:"Prière",
  name: "En allant à la mosquée",
  arabe: "اللَّهُمَّ اجْعَلْ فِي قَلْبِي نُورًا وَفِي لِسَانِي نُورًا وَفِي سَمْعِي نُورًا وَفِي بَصَرِي نُورًا وَمِنْ فَوْقِي نُورًا وَمِنْ تَحْتِي نُورًا وَعَنْ يَمِينِي نُورًا وَعَنْ شِمَالِي نُورًا وَمِنْ أَمَامِي نُورًا وَمِنْ خَلْفِي نُورًا وَاجْعَلْ لِي نُورًا",
  traduction: "O Allah, mets de la lumière dans mon cœur, dans ma langue, dans mon ouïe, dans ma vue, au-dessus de moi, en dessous de moi, à ma droite, à ma gauche, devant moi, derrière moi, et accorde-moi la lumière",
  ),
  Duas(id: 8,
  category:"Prière",
  name: "En sortant de la mosquée",
  traduction: "O Allah, que la prière, la paix et les bénédictions soient sur le Prophète Muhammad, ô Allah, je Te demande de Ta grâce",
  arabe: "اللَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ، اللَّهُمَّ إِنِّي أَسْأَلُكَ مِنْ فَضْلِكَ",
  ),
  Duas(id: 9,
  category:"Prière",
  name: "De l'appel à la prière",
  arabe: "اللَّهُمَّ رَبَّ هَذِهِ الدَّعْوَةِ التَّامَّةِ وَالصَّلَاةِ الْقَائِمَةِ آتِ مُحَمَّدًا الْوَسِيلَةَ وَالْفَضِيلَةَ وَابْعَثْهُ مَقَامًا مَحْمُودًا الَّذِي وَعَدْتَهُ",
  traduction: "O Allah, Seigneur de cet appel parfait et de la prière établie, accorde à Muhammad la médiation et la vertu, et ressuscite-le à la station louable que Tu lui as promise",
  ),
  Duas(id: 10,
  category:"Prière",
  name: "De l'ouverture de la prière",
  arabe: "سُبْحَانَكَ اللَّهُمَّ وَبِحَمْدِكَ وَتَبَارَكَ اسْمُكَ وَتَعَالَى جَدُّكَ وَلَا إِلَهَ غَيْرُكَ",
  traduction: "Gloire et louange à Toi, ô Allah, béni soit Ton nom, exaltée soit Ta majesté, et il n'y a de divinité digne d'adoration en dehors de Toi",
  ),
  Duas(id: 11,
  category:"Prière",
  name: "De l'inclinaison",
  arabe: "سُبْحَانَ رَبِّيَ الْعَظِيمِ",
  traduction: "Gloire à mon Seigneur le Très Grand",
  ),
  Duas(id: 12,
  category:"Prière",
  name: "De la prosternation",
  arabe: "سُبْحَانَ رَبِّيَ الْأَعْلَى",
  traduction: "Gloire à mon Seigneur le Très Haut",
  ),
  Duas(id: 13,
  category:"Prière",
  name: "Entre les deux prosternations",
  arabe: "رَبِّ اغْفِرْ لِي وَارْحَمْنِي وَاهْدِنِي وَعَافِنِي وَارْزُقْنِي",
  traduction: "Seigneur, pardonne-moi, fais-moi miséricorde, guide-moi, accorde-moi la santé et pourvois à mes besoins",
  ),
  Duas(id: 14,
  category:"Prière",
  name: "De la prosternation de la récitation du Coran",
  arabe: "اللَّهُمَّ اكْتُبْ لِي بِهَا عِنْدَكَ أَجْرًا وَضَعْ عَنِّي بِهَا وِزْرًا وَاجْعَلْهَا لِي عِنْدَكَ ذُخْرًا وَتَقَبَّلْهَا مِنِّي كَمَا تَقَبَّلْتَهَا مِنْ عَبْدِكَ دَاوُودَ",
  traduction: "O Allah, inscris pour moi par elle une récompense auprès de Toi, efface par elle un péché de moi, fais-en pour moi une provision auprès de Toi et accepte-la de moi comme Tu l'as acceptée de Ton serviteur David",
  ),
  Duas(id: 15,
  category:"Prière",
  name: "L'attestation de foi",
  arabe: "أَشْهَدُ أَنْ لا إِلَهَ إِلاّ اللهُ وَحْدَهُ لا شَرِيكَ لَهُ وَأَشْهَدُ أَنَّ مُحَمَّدًا عَبْدُهُ وَرَسُولُهُ",
  traduction: "J'atteste qu'il n'y a de divinité digne d'être adorée qu'Allah, l'Unique, sans associé, et j'atteste que Muhammad est Son serviteur et Son messager",
  ),
  Duas(id: 16,
  category:"Prière",
  name: "La prière sur le Prophète (saws) après l'attestation",
  arabe: "اللَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ كَمَا صَلَّيْتَ عَلَى إِبْرَاهِيمَ وَعَلَى آلِ إِبْرَاهِيمَ إِنَّكَ حَمِيدٌ مَجِيدٌ",
  traduction: "O Allah, prie sur Muhammad et sur la famille de Muhammad comme Tu as prié sur Ibrahim et sur la famille d'Ibrahim, Tu es en vérité Digne de louange et Glorieux",
  ),
  Duas(id: 17,
  category:"Prière",
  name: "Après la prière",
  arabe: "اللَّهُمَّ أَنْتَ السَّلَامُ وَمِنْكَ السَّلَامُ تَبَارَكْتَ يَا ذَا الْجَلَالِ وَالْإِكْرَامِ",
  traduction: "O Allah, Tu es la Paix et de Toi vient la paix, Tu es béni, ô Toi qui possède la majesté et la générosité",
  ),
  //category: "Voyage",
  Duas(id: 31,
  category:"Voyage",
  name: "En enfourchant une monture ou en empruntant un moyen de transport",
  arabe: "بِسْمِ اللَّهِ، الْحَمْدُ لِلَّهِ، سُبْحَانَ الَّذِي سَخَّرَ لَنَا هَذَا وَمَا كُنَّا لَهُ مُقْرِنِينَ وَإِنَّا إِلَى رَبِّنَا لَمُنْقَلِبُونَ",
  traduction: "Au nom d'Allah, louange à Allah, Gloire à Celui qui a mis ceci à notre disposition alors que nous n'étions pas capables de le dominer, et c'est vers notre Seigneur que nous retournerons",
  ),
  Duas(id: 32,
  category:"Voyage",
  name: "En montant sur une colline ou une montagne",
  arabe: "اللَّهُ أَكْبَرُ",
  traduction: "Allah est le plus grand",
  ),
  Duas(id: 33,
  category:"Voyage",
  name: "En descendant d'une colline ou d'une montagne",
  arabe: "سُبْحَانَ الَّذِي سَخَّرَ لَنَا هَذَا وَمَا كُنَّا لَهُ مُقْرِنِينَ وَإِنَّا إِلَى رَبِّنَا لَمُنْقَلِبُونَ",
  traduction: "Gloire à Celui qui a mis ceci à notre disposition alors que nous n'étions pas capables de le dominer, et c'est vers notre Seigneur que nous retournerons",
  ),
  Duas(id: 34,
  category:"Voyage",
  name: "En entrant dans une ville ou un marché",
  arabe: "اللَّهُمَّ رَبَّ السَّمَوَاتِ السَّبْعِ وَمَا أَظَلَّتْ وَرَبَّ الْعَرْشِ الْعَظِيمِ، رَبِّنَا وَرَبَّ كُلِّ شَيْءٍ، فَالِقَ الْحَبِّ وَالنَّوَى، وَمُنْزِلَ التَّوْرَاةِ وَالْإِنْجِيلِ وَالْفُرْقَانِ، أَعُوذُ بِكَ مِنْ شَرِّ كُلِّ شَيْءٍ أَنْتَ آخِذٌ بِنَاصِيَتِهِ، اللَّهُمَّ أَنْتَ الْأَوَّلُ فَلَيْسَ قَبْلَكَ شَيْءٌ، وَأَنْتَ الْآخِرُ فَلَيْسَ بَعْدَكَ شَيْءٌ، وَأَنْتَ الظَّاهِرُ فَلَيْسَ فَوْقَكَ شَيْءٌ، وَأَنْتَ الْبَاطِنُ فَلَيْسَ دُونَكَ شَيْءٌ، اقْضِ عَنَّا الدَّيْنَ وَأَغْنِنَا مِنَ الْفَقْرِ",
  traduction: "O Allah, Seigneur des sept cieux et de ce qu'ils ombragent, Seigneur du Trône immense, notre Seigneur et Seigneur de toute chose, Diviseur de la graine et du noyau, Révélateur de la Thora, de l'Evangile et du Coran, je me réfugie auprès de Toi contre le mal de tout ce que Tu saisis par les cheveux, O Allah, Tu es le Premier, il n'y a rien avant Toi, et Tu es le Dernier, il n'y a rien après Toi, Tu es le Manifeste, il n'y a rien au-dessus de Toi, et Tu es le Caché, il n'y a rien en dehors de Toi, acquitte-nous de nos dettes et préserve-nous de la pauvreté",
  ),
  Duas(id: 35,
  category:"Voyage",
  name: "En sortant d'une ville ou d'un marché",
  arabe: "اللَّهُمَّ إِنِّي أَعُوذُ بِكَ أَنْ أَضِلَّ أَوْ أُضَلَّ، أَوْ أَ زِلَّ أَ وْ أُزَلَّ، أَوْ أَظْلِمَ أَوْ أُظْلَمَ، أَوْ أَجْهَلَ أَوْ يُجْهَلَ عَلَيَّ",
  traduction: "O Allah, je me réfugie auprès de Toi contre le fait de m'égarer ou d'égarer, de glisser ou de faire glisser, d'opprimer ou d'être opprimé, d'ignorer ou d'être ignoré",
  ),
  Duas(id: 36,
  category:"Voyage",
  name: "En montant sur une monture",
  arabe: "الْحَمْدُ لِلَّهِ الَّذِي سَخَّرَ لَنَا هَذَا وَمَا كُنَّا لَهُ مُقْرِنِينَ وَإِنَّا إِلَى رَبِّنَا لَمُنْقَلِبُونَ",
  traduction: "Louange à Allah qui nous a soumis ceci alors que nous n'étions pas capables de le dominer, et c'est vers notre Seigneur que nous retournerons",
  ),
  Duas(id: 37,
  category:"Voyage",
  name: "En descendant d'une monture",
  arabe: "سُبْحَانَ الَّذِي سَخَّرَ لَنَا هَذَا وَمَا كُنَّا لَهُ مُقْرِنِينَ وَإِنَّا إِلَى رَبِّنَا لَمُنْقَلِبُونَ",
  traduction: "Gloire à Celui qui nous a soumis ceci alors que nous n'étions pas capables de le dominer, et c'est vers notre Seigneur que nous retournerons",
  ),
  Duas(id: 38,
  category:"Voyage",
  name: "Au voyageur du resident",
  arabe: "أَسْتَوْدِعُ اللَّهَ دِينَكَ وَأَمَانَتَكَ وَخَوَاتِيمَ عَمَلِكَ",
  traduction: "Je confie à Allah ta religion, tes biens et la fin de tes actions",
  ),
  Duas(id: 39,
  category:"Voyage",
  name:"Du resident au voyageur",
  arabe: "أَسْتَوْدِعُكُمُ اللَّهَ الَّذِي لَا تَضِيعُ وَدَائِعُهُ",
  traduction: "Je vous confie à Allah, Celui dont les dépôts ne sont jamais perdus",
  ),
  Duas(id: 40,
  category:"Voyage",
  name: "Lorsque l'on campe en plein air",
  arabe: "اللَّهُمَّ إِنَّا نَجْعَلُكَ فِي نُحُورِهِمْ وَنَعُوذُ بِكَ مِنْ شُرُورِهِمْ",
  traduction: "O Allah, nous Te plaçons à l'arrière de leur armée et nous nous réfugions auprès de Toi contre leurs méfaits",
  ),
  //category: "Maladie & Mort",
  Duas(id: 41,
  category:"Maladie & Mort",
  name: "Ce que l'on dit en visitant un malade",
  arabe: "لا بَأْسَ طَهُورٌ إِنْ شَاءَ اللَّهُ",
  traduction: "Il n'y a pas de mal,c'est une purification si Allah le veut",
  ),
  Duas(id: 42,
  category:"Maladie & Mort",
  name: "Pour demander la protection d'Allah sur les enfants",
  arabe: "أُعِيذُكُمَا بِكَلِمَاتِ اللَّهِ التَّامَّةِ مِنْ كُلِّ شَيْطَانٍ وَهَامَّةٍ وَمِنْ كُلِّ عَيْنٍ لَامَّةٍ",
  traduction: "Je vous protège par les paroles parfaites d'Allah contre tout diable, animal venimeux et tout mauvais œil",
  ),
  Duas(id: 43,
  category:"Maladie & Mort",
  name: "Le merite de rendre visite a un malade",
  arabe: "لا يَعُودُ مُسْلِمٌ يَعُودُ مُسْلِمًا فِي يَوْمٍ إِلَّا صَرَفَ اللَّهُ عَنْهُ بِهِ سَبْعِينَ أَلْفَ حَدِيثٍ",
  traduction: "Un musulman qui rend visite à un autre musliman le jour, Allah lui écarte soixante-dix mille calamités",
  ),
  Duas(id: 44,
  category:"Maladie & Mort",
  name: "Du malade qui perd espoir de vivre",
  arabe: "اللَّهُمَّ اغْفِرْ لِي وَارْحَمْنِي وَأَلْحِقْنِي بِالرَّفِيقِ الْأَعْلَى",
  traduction: "O Allah, pardonne-moi, fais-moi miséricorde et accorde-moi la compagnie de la plus haute compagnie",
  ),
  Duas(id: 45,
  category:"Maladie & Mort",
  name: "Du malade qui souffre",
  arabe: "اللَّهُمَّ رَبَّ النَّاسِ أَذْهِبِ الْبَأْسَ، اشْفِهِ وَأَنْتَ الشَّافِي لَا شِفَاءَ إِلَّا شِفَاؤُكَ شِفَاءً لَا يُغَادِرُ سَقَمًا",
  traduction: "O Allah, Seigneur des hommes, éloigne la souffrance, guéris-le, Tu es le Guérisseur, il n'y a pas de guérison sauf Ta guérison, une guérison qui ne laisse aucune maladie",
  ),
  Duas(id: 46,
  category:"Maladie & Mort",
  name: "Apres avoir ferme les yeux d'un mort",
  arabe: "إِنَّا لِلَّهِ وَإِنَّا إِلَيْهِ رَاجِعُونَ اللَّهُمَّ أْجُرْنِي فِي مُصِيبَتِي وَأَخْلِفْ لِي خَيْرًا مِنْهَا",
  traduction: "Nous appartenons à Allah et c’est à Lui que nous retournons O Allah,récompense-moi dans mon malheur et remplace-le moi par quelque chose de meilleur",
  ),
  Duas(id: 47,
  category:"Maladie & Mort",
  name: "Apres l'inhumation du mort",
  arabe: "اللَّهُمَّ اغْفِرْ لَهُ وَارْحَمْهُ وَعَافِهِ وَاعْفُ عَنْهُ وَأَكْرِمْ نُزُلَهُ وَوَسِّعْ مُدْخَلَهُ وَاغْسِلْهُ بِالْمَاءِ وَالثَّلْجِ وَالْبَرَدِ وَنَقِّهِ مِنَ الْخَطَايَا كَمَا نَقَّيْتَ الثَّوْبَ الْأَبْيَضَ مِنَ الدَّنَسِ وَأَبْدِلْهُ دَارًا خَيْرًا مِنْ دَارِهِ وَأَهْلًا خَيْرًا مِنْ أَهْلِهِ وَزَوْجَةً خَيْرًا مِنْ زَوْجِهِ وَأَدْخِلْهُ الْجَنَّةَ وَأَعِذْهُ مِنْ عَذَابِ الْقَبْرِ وَعَذَابِ النَّارِ",
  traduction: "O Allah, pardonne-lui, fais-lui miséricorde, accorde-lui la guérison, pardonne-lui, honore son séjour, élargis son entrée, lave-le avec de l'eau, de la neige et de la glace, purifie-le de ses péchés comme Tu purifies le vêtement blanc de la saleté, remplace-lui sa maison par une meilleure maison, sa famille par une meilleure famille, sa femme par une meilleure femme, fais-le entrer au Paradis, protège-le du châtiment de la tombe et du châtiment de l'Enfer",
  ),
  Duas(id: 48,
  category:"Maladie & Mort",
  name: "En visitant un cimetiere",
  arabe: "السَّلَامُ عَلَيْكُمْ دَارَ قَوْمٍ مُؤْمِنِينَ وَإِنَّا إِنْ شَاءَ اللَّهُ بِكُمْ لَاحِقُونَ نَسْأَلُ اللَّهَ لَنَا وَلَكُمُ الْعَافِيَةَ",
  traduction: "Que la paix soit sur vous, demeure de croyants, nous vous rejo indrons si Allah le veut, nous demandons à Allah pour nous et pour vous la santé",
  ),
];

// Correction ici : on génère les catégories à partir de localDuas
List<String> getCategories() {
  List<String> categories = localDuas.map((duas) => duas.category).toSet().toList();
  categories.insert(0, "Tous"); // Ajouter l'option "Tous" en premier
  return categories;
}
