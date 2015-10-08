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
