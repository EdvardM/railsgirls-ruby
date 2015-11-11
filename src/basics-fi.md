# Rubyn perusteet

## Aloitussanat

Tervetuloa ohjelmoinnin ihmeelliseen maailmaan!

Ohjelmointi on **monimutkaisten asioiden abstrahointia**. Ohjelmoinnin avulla
voidaan ratkaista lähes rajatta vaikka kuinka mutkikkaita ongelmia. Kuitenkin
ohjelmistojen mutkikkaimmatkin komponentit koostuvat yhä yksinkertaisemmista
komponeinteista, kunnes ne koostuvat kielen tarjoamista perusrakenteista, primitiiveistä.

Jokainen tietokoneohjelma siis koostuu näistä yksinkertaisista primitiiveistä,
ja jo pelkästään niiden avulla voidaan toteuttaa hyvinkin mutkikkaita
järjestelmiä. Primitiiveillä tarkoitan tässä sellaisia kuten muuttujat,
ehtolauseet, silmukat ja perustietotyyppejä kuten taulukot, numerot ja
merkkijonot (voit ajatella tekstin koostuvan yhdestä tai useammasta
merkkijonosta).


Tämän oppaan tarkoituksena on tehdä mainitut primitiivit tunnetuiksi kelle
hyvänsä lukijalle.

### Miksi jälleen uusi opas?

Maailma on täynnä monia parempia oppaita, mutta niistä lyhimmätkin ovat
mielestäni liian pitkiä.
[Why The Lucky Stiff:in](http://mislav.uniqpath.com/poignant-guide/book/chapter-1.html) opas
on erinomainen ja kaukana kuivasta, mutta se on pitkä (suosittelen kuitenkin!).

Tavoitteenani on käydä lävitse pienin tarvittava määrä tietoa, jotta ohjelmoinnissa pääsisi alkuun. Samalla luottaen siihen, että puuttuvat osat on helppo selittää sitten kun niitä tarvitaan. Aloitetaanpa!

### Käytetyt merkinnät

Olutusarvoisesti mikä hyvänsä, joka näyttää allaolevalta

```ruby
# somefile.rb
puts "Howdy" # tässä meillä on Ruby-koodia
```

on jotain, mikä voidaan kirjoittaa Ruby-tulkkiin. Eli avaa terminaali ja kirjoita `pry` tai `irb`.

**irb** on "interactive Ruby interpreter", eli interaktiivinen ruby-tulkki, jonka avulla voit testata koodia välittömästi. irb tulee mukana kaikissa Ruby-asennuksissa. **Pry** on puolestaan korvike irb:lle, jonka avulla työskentely Rubyn kanssa on paljon miellyttävämpää. Siinä on mukavat värit ja vaikka mitä. Oletan tästedes että käytät Pry:ta (asennusohjeet alla kohdassa 'Työkalut'), mutta voit käyttää ihan hyvin vain irb:tä jos haluat.

{tip-begin}
Välillä näet tämänkaltaisia ohjeita. Voit sivuuttaa ne hyvin lukiessasi materiaalia ensimmäistä kertaa. Niissä on kuitenkin hyödyllistä tietoa, joihin on ehkä hyvä tutustua ainakin myöhemmin.
{tip-end}

Jos kirjoitettua koodia voidaan kokeilla sellaisenaan, ehdotan
tiedostonimeä ohjelmalistauksen alussa, kuten `somefile.rb` yllä. Voit käyttää mitä hyvänsä muuuta nimeä, mutta se täytyy ottaa huomioon kun myöhemmin suoritat ohjelmaa.

Teksti, joka on muotoa

> cd projects/ruby-tutorial

on tarkoitettu kirjoitettavaksi terminaaliin, ei siis irb- tai pry-tulkkiin. Huomaa myös, että '$' ei kopioidu mukaan jos haluat kopioida tekstin leikepöydälle ja liittää sen terminaali-istuntoon.

Suosittelen pitämään kolmea ikkunaa avoinna harjoitellessasi. Yhdessä
tekstieditori sekä kaksi terminaalia samassa hakemistossa. Toisessa
terminaalissa pry jatkuvasti avoinna, ja toisesta käsin voit ajaa
tallentamiasi editorilla kirjoittamiasi ohjelmia. Näin vältyt toistuvalta
ohjelmien uudelleenkäynnistämiseltä.

### Työkalut

Tarvitset vain Rubyn ja tekstieditorin (suosittelen Sublimea tai Atomia). Mikä vain Ruby-versio 1.9.3:sta ylöspäin käy, joskin 2.2 tai uudempi on suositeltavaa. Voit tarkistaa versiosi komennolla

> ruby -v

Jos käytät OS X:ää tai Linuxia, RVM tai rbenv on hyvä tapa Rubyn asennukseen. Voit asentaa RVM:n komennolla

{tip-begin}
Yleisesti haluat välttää ajamasta sokkona netistä löytyviä mielivaltaisia skriptejä. Voit luonnollisesti tarkistaa molempien linkkien sisällön, näistä jälkimmäinen bit.ly -skrpiti on minun kirjoittamani.
{tip-end}

> curl -sSL https://get.rvm.io | bash -s stable --ruby

Asentaaksesi Pry:n ja muutaman muun mukavan työkalun, komenna

> curl -sSL http://bit.ly/1LaIHjX | bash

Jos haluat asentaa mainitut työkalut käsin tai curl-komento ei ole saatavilla (esim. Windows), suorita

> gem install -q --no-ri --no-rdoc pry pry-doc pry-coolline awesome_print

ja olet valmis aloittamaan.

## Tietotyypit

Kaikki ohjelmat koostuvat bkahdesta asiasta: *datasta* ja *funktioista* jotka tekevät juttuja sille tiedolle. Tarkastellaan lähemmin hyvin yksinkertaista ohjelmaa jossa on molempia, ja joka tekee jotain järkevää suoritettaessa.

```ruby
# hello.rb
puts "Oh my, cinnamon buns!"

puts "Kittens are " + " so fluffy"
puts "moar kittens in examples!".upcase
```

Data on vain tietoa kuten tekstiä, numeroita, kuvia ja videoita. Se ei tee itsessään mitään. Jopa yksinkertainen teksti pitää tulostaa, ennenkuin se voidaan lukea. Tässä esimerkissä **merkkijono** `"Oh my, cinnamon buns!"` on dataa, kuten myös `"Kittens are "`, `"so fluffy"` yms. `puts` on funktio joka _tekee tiedolle jotain_, tässä siis tulostaa mitä hyvänsä funktiolle syötetään. `upcase` on myös eräänlainen funktio, joka on "sidottu" vain merkkijonoihin.

Huomaa myös, että ohjelmarivien välissä voi olla haluamasi määrä tyhjiä rivejä. Käytä tyhjiä rivejä sisällön loogiseen ryhmittelyyn samaan tapaan kuten luonnollisessa kielessä. Ruby ei välitä: voit kirjoittaa kaikki Ruby-ohjelmat halutessasi yhdelle hyvin pitkälle riville. Luettavuus on ihmistä eikä tietokonetta varten. Selkeys on tärkeää.

Lisäsin yllä yhden tyhjän rivin ensimmäisen ja kahden viimeisen väliin, koska ensimmäinen ei tee merkkijonolle mitään muuta kuin tulostaa sen. Kaksi muuta ovat hieman mutkikkaampia.

Jos kirjoitit koodin editoriin, voit kokeilla sen suorittamista sanomalla

> ruby hello.rb

Huomasithan, että merkkijonot Rubyssä pitää ympäröidä sitaateilla, joko kaksin- (`"`) tai yksinkertaisilla (`'`). Tässä vaiheessa ei ole väliä kumpaa muotoa käytät, mutta käytä mieluusti jompaa kumpaa johdonmukaisesti.

Myös **numerot** ovat hyvin yleisiä. Itse asiassa numerotyyppejäkin on useita tiettyjen ongelmien vuoksi, mutta tässä vaiheessa ei tarvitse välittää vielä niistä. Esimerkiksi


```ruby
# numbers.rb
puts 1 + 2

# Huom! se on(30 / 3) + 4, ei 30 / (3 + 4). Ihan kuten koulussakin.
puts 30 / 3 + 4

puts 10 / 3.0    # 3.3333333...
puts 10 / 3      # Huom: jakolasku kokonaisluvuilla, koska jakaja ja jaettava ovat kokonaislukuja
```

Kuten aikaisemminkin, jos sinulla on terminaali avoinna samassa hakemistossa kuin tiedosto `numbers.rb`, tallenna tiedosto editorissasi ja suorita

> ruby numbers.rb

Nyt tiedämme numeroista ja merkijonoista. Entä mitä jos meillä on jotain asiaa monta kappaletta? Sitä varten on listat, tai Rubyssä puhumme yleensä _taulukoista_. Niiden avulla voi tehdä monenlaisia asioita, ja ne ovat varsin keskeisiä lähes kaikissa ohjelmissa:

```ruby
# arrays.rb
some_stuff = ['kitten', 'dog', 'llama']

puts some_stuff        # tulostaa kunkin merkkijonon omalle rivilleen
puts some_stuff.length # 3, koska listassa 3 alkiota

 # lähes kaikki ohjelmointikielet aloittavat taulukon
 # indeksoinnin nollasta, joten 1. alkio on indeksissä 0!
puts some_stuff[0]     # kitten
puts some_stuff[1]     # dog
puts some_stuff[2]     # llama
puts some_stuff[-1]    # -1 tarkoittaa viimeistä alkiota, -2 toiseksiviimeistä jne

puts some_stuff.sort   # tulostaa dog, kitten ja llama tässä järjestyksessä
# Rubyssä taulukot voivat sisältää erilaisia tietotyyppejä
puts ['dog', 42].length

# Yow dawg, heard you like arrays so I put array in your array
not_even_funny = [2, 'bananas', [4, 5]]
# tulostaa sekä 4 että 5, koska viimeinen alkio on taulukko [4, 5]
puts not_even_funny[-1]
```

Olet ehkä jo arvannut, että Ruby ei huomioi rivejä, jotka alkavat merkillä `#`. Ne ovat _kommentteja_, tarkoitettu koodia lukeville ihmisille.

Nyt siis meillä on _merkkijonoja_, _numeroita_ ja _taulukoita_. Olemme myös nähneet muutamia funktioita. Mutta miksi jotkut niistä ovat tietoja ennen, kuten `puts`, ja jotkut tietojen jälkeen pisteen kera, kuten `length`? Jälkimmäinen on esimerkki _metodista_. Voit ajatella sitä funktiona, joka on tiiviisti sidottu johonkin tietoon. Tässä vaiheessa sillä ei ole niin merkitystä puhutaanko funktioista vai metodeista. Oleellista on se, että molemmat tekevät asioita tiedolle -- muuntavat sitä, tallentavat sen johonkin (kuten kirjoittaminen tiedostoon), laskevat asioita jne.

Näimme jotain muutakin. Koodissa oleva `some_stuff` on _muuttuja_. Niitä
käytetään esimerkiksi antamaan käsitteille kuvaavia nimiä, välttämään
tarpeetonta toistoa silloin, kun jonkin laskeminen on verrattain aikaavievää, tallentamaan jonkin nykyinen tila jne. Ehkä yleisin syy on kuitenkin asioiden nimeäminen. Katsotaanpa vaikkapa seuraavaa:

```ruby
User.all.select { |u| !u.admin? && u.created_at >= Time.now - 7.days }.each do |u|
  puts u
end
```

Ellei lukija ole entuudestaan kokenut niin Railsin kuin Rubyn suhteen, koodista ei ole kovin helppoa nähdä mitä oikeastaan tulostetaan. Tarkastellaan seuraavaksi versiota, joka jakaa toiminnallisuuden kahteen osaan käyttäen samalla kuvaavampia nimiä muuttujille:

```ruby
min_creation_time = Time.now - 7.days
recent_non_admins = User.all.select { |u| !u.admin? && u.created_at >=  min_creation_time }

recent_non_admins.each do |user|
  puts user
end
```

Koodin voisi kirjoittaa vielä kuvaavammin tai elegantimmalla tavalla, mutta meillä ei ole vielä siihen työkaluja. Saavutimme kuitenkin jo jotain tärkeää:
`recent_normal_users` kertoo lukijalle, että muuttuja sisältää taulukon hiljattain luotuja käyttäjiä, jotka eivät ole järjestelmän ylläpitäjiä. Jos haluat vain muuttaa miten käyttäjät tulostetaan, voit hyvin jättää huomiotta mutkikkaamman lausekkeen jolla käyttäjät luetaan muuttujaan, samoin sen miten se tarkkaanottaen tapahtuu. Voit keskittyä vain siihen osaan, missä käyttäjät tulostetaan.

Samoin huomaamme, että uuden muuttujan käyttöönotto onnistuu yksinkertaisesti antamalla sille arvo. Jotkin kielet vaativat erillistä muuttujien esittelyä, mutta Rubyssä käyttöönotto onnistuu vain sijoittamalla niille jokin arvo. Sijoittaminen tapahtuu aina käyttämällä yhtäsuuruusmerkkiä `=`.

### Luettavuudesta

Tietokoneohjelmien kirjoittaminen on vaikeaa, mutta lukeminen on vielä
vaikeampaa, jopa oman ohjelmakoodin. Jo muutaman viikon kuluttua on helppo
unohtaa mitä jokin kohta koodissasi oikein tekee. Jotkut puhuvat hyvin
kommentoidusta koodista, mutta vielä tärkeämpää on kirjoittaa luettavaa
koodia. Kommenttien ongelma on siinä, että ohjelmointikielten tulkit ja
kääntäjät _jättävät ne huomioimatta_, ja siten ne jäävät myös helposti
päivittämättä. Koodi, jossa kommentit ovat vanhentuneita ja harhaanjohtavia on
huonompaa kuin koodi, jossa ei ole kommentteja.

Parhaillaan koodi on itsedokumentoivaa. Sellaisessa koodissa muuttujat ja
funktioiden nimet ovat kuvaavia. Vaikka kommentit ovat joskus tarpeellisia
asioiden selittämiseen lukijalle, niitä tarvitaan harvemmin, jos nimeät asiat
hyvin.

Voiko nimet valita sitten täysin vapaasti? Käytännössä kyllä. Kaikki muuttujanimet ovat täysin mielivaltaisia. Siinä missä esim. `a` ja `z` eivät ole järin kuvaavia, ne ovat ihan kelvollisia (kielen näkökulmasta) nimiä muuttujille. Niin on myös

`a_really_funny_kissa_with_hayfever_danced_over_the_shiny_rainbow`.

Ruby ei välitä yhtään nimistä, mitä käytät. Niihin ei liity minkäänlaista merkitystä. Se näkee vain jonon symboleita. Siten on suositeltavaa nimetä asiat niin hyvin kuin osaat. Siitä on myöhemmin paljon apua niin itsellesi kuin muillekin.

#### Säännöt asioiden nimeämiselle

Mikä vain käy, kunhan se koostuu kirjaimista a:sta z:n, numeroista ja alaviivasta '_'. Ainoa rajoite nimille on, että se ei voi alkaa numerolla. Toisin sanoen `kitteh_42` on kelvollinen nimi, kun taas `42_kitteh` ei ole. Sama sääntö koskee myös metodeja ja funktioita.

{tip-begin}
<p>
Rybyssä alaviivaa käytetään sanojen erottamiseen. Käytä aina pieniä kirjaima. ISOT_KIRJAIMET ja ns. "CamelCaseNamingConvention" on varattu vakioille, luokille ja muille asioille, joista puhumme myöhemmin.</p>

<p>On myös _mahdollista_ käyttää suomenkieltä asioiden nimeämiseen jos haluat. Se on nykyää mahdollista siksi, että ns. UTF-merkistö on yleistynyt ohjelmointikielienkin joukossa. Näinollen esimerkiksi muuttujannimi `ämpäri` on nykyään mahdollinen, toisin kuin muutama vuosi sitten. Kaikki kielet eivät vieläkään sallisi sitä. En kuitenkaan suosittele sitä, koska englanninkieli on selvästikin ohjelmointikielten _lingua franca_, yleiskieli. Minkä hyvänsä muun luonnollisen kielen käyttö tulee herättämään yleistä pahennusta, ja muut tulevat mulkoilemaan sinua sillä silmällä. Tiedäthän, nenänvartta pitkin.</p>

<p>Tämä siis siitäkin huolimatta, että muiden kuin englanninkielen käyttäminen tekee ilmeiseksi sen, mikä on itsekirjoittamaasi koodia ja mikä tulee ns. vakiokirjastoista tai kielestä itsestään. En silti kannata sitä, vaan kehotan pysymään englanninkielessä. Valinta on luonnollisesti kuitenkin omasi.</p>
{tip-end}

### Yhteenveto

Nyt siis tiedämme -- tai olemme ainakin nähneet -- kolmenlaisia asioita:

1. Data (tieto, informaatio). Tietotyyppejä on erilaisia, ja olemme tavanneet näistä kolme. Vastaavat Ruby-tyypit tai -luokat sulkeissa:
  * Merkkijonot (String)
  * Numerot (Fixnum, Float)
  * Taulukot (Array), jotka voivat sisältää mitä vain tietotyyppejä, mukaanlukien taulukoita
2. Funktioita/metodeja, joilla tiedolle voidaan tehdä operaatioita
  * Edellisessä esimerkissä käytettiin _taulukkometodeja_ pituuden hakemiseen (`length`), ja metodilla `sort` saatiin tuotettua taulukko, joka on aakkosjärjestyksessä. Metodilla `upcase` muunnettin merkkijono isoiksi kirjaimiksi.
  * Metodeista lisää myöhemmin
3. Tutustuimme pintapuolisesti muuttujiin, jotka ovat vain nimiä asioille tietokoneen muistissa
