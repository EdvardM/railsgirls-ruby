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
puts "Howdy" # here we have some Ruby code
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
