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

Muuten, huomaa että kun puhun tulostamisesta, tarkoitan sillä vain näytölle tulostumista. Et tarvitse näissä harjoituksissa tulostinta tai paperia :)

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
users.select { |u| !u.admin? && u.created >= Time.now - 7.days }.each do |u|
  puts u
end
```

Ellei lukija ole entuudestaan kokenut niin Railsin kuin Rubyn suhteen, koodista ei ole kovin helppoa nähdä mitä oikeastaan tulostetaan. Tarkastellaan seuraavaksi versiota, joka jakaa toiminnallisuuden kahteen osaan käyttäen samalla kuvaavampia nimiä muuttujille:

```ruby
min_creation_time = Time.now - 7.days
recent_non_admins = users.select { |u| !u.admin? && u.created >=  min_creation_time }

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
  * Taulukot (Array), jotka voivat sisältää mitä vain tietotyyppejä, mukaanlukien taulukoita[^fn-array]
2. Funktioita/metodeja, joilla tiedolle voidaan tehdä operaatioita
  * Edellisessä esimerkissä käytettiin _taulukkometodeja_ pituuden hakemiseen (`length`), ja metodilla `sort` saatiin tuotettua taulukko, joka on aakkosjärjestyksessä. Metodilla `upcase` muunnettin merkkijono isoiksi kirjaimiksi.
  * Metodeista lisää myöhemmin
3. Tutustuimme pintapuolisesti muuttujiin, jotka ovat vain nimiä asioille tietokoneen muistissa

## Älykäs toiminta

Kuvittele ohjelmoivasi robottia, joka jauhaa ja tarjoilee kahvia. Jossa on päällä vähän
kermaa, kanelia ja suklaalastuja sekä ripaus sokeria pinnalla.

Kuvittele myös, että osaisin oikeasti piirtää kuvia, ja tässä olisi kiva, taiteellinen kuvitus missä joviaali robottimme tarjoilee kupposen kuumaa kahvia. No niin.

Nyt kun kuva on mielessäsi, oletetaan, että robotti on ohjelmoitu tarjoamaan täsmälleen 80cl kahvia ja 40cl kermaa jokaiseen kupilliseen. Koodi saattaisi näyttää tällaiselta:

```ruby
bot = Robot.new("Jeeves the Valiant Valet")

bot.pour_coffee(800) # Robottimme käyttää ehkä millilitroja nesteiden yksikköinä
bot.spray_whipped_cream(400)
bot.sprinkle_chocolate_chips(5) # grammoja luultavasti
bot.sprinkle_cinnamon(1) # grammoja nämäkin (mikä on kanelin LD50???)
bot.frost_with_sugar
```

Jos kaikki on hyvin, metallinen ystävämme surisisi iloisesti ympäriinsä hyvää kahvia tarjoillen. Kaikki tähän mennessä hyvin.

Nyt kuvittele, että joku raasu tönäisisi vahingossa kahvikuppia siten, että se ei olisi enää robottimme suutinten alla. Silloin tuo kiehuvan kuuma neste päätyisi lattialle sotkien mattosi, tai vielä pahempaa, se voisi satuttaa pörröistä [skottilaskostasi](http://www.scottishfoldlove.com/) :( Mitä tehdä?

Välttääksemme jatkossa aiheuttamasta karvaita kokemuksia kissalle, voimme tehdä asioita _ehdollisesti_. Mikäli jokin ehto täyttyy, tee näin. Muutoin tee noin.

Jokaisessa ohjelmointikielessä on jonkinlainen tapa tähän. Niistä yleisin on `if`-lause:

```ruby
if <ehtolause>
  # suoritettava koodi, kun ehto on tosi
else
  # suoritettava koodi, kun ehto ei ole tosi
end
```

Huomaa että merkintätapa `<juttuloita>` tarkoittaa, että `juttuloita` ei pidä kirjoittaa sellaisenaan, vaan korvata se vastaavalla lausekkeella. Tässä tapauksessa `<ehtolause>` tarkoittaa jotain Ruby-koodia, joka vastaa arvoa `true` tai `false`. Esimerkkejä: `my_number < 42`,
`a_string == "cat"`, `array.size > 3`.

Oletetaan että kaikki Jeeves-robottimme juomia kaatavat toiminnot käyttävät sisäistä apumetodia`inject`:

```ruby
nozzle.inject('coffee', amount: 800, manner: 'pour')
nozzle.inject('cream', amount: 400, manner: 'spray')
```

Välttääksemme onnettomuuksia meidän täytyy tunnistaa, onko kuppi suutinten
alla vai ei. Muokkaisimme siis metodia `inject` seuraavasti:

```ruby
def inject(substance, options)
  ...
  if sensor.cup_detected?
    actually_inject_stuff(substance, options)
  else
    system.alert("Please do set your favourite container of hot beverages "
                 "to appropriate position and alignment")
  end
end
```

Nyt olemme korjanneet ongelman! Jos metodi `sensors.cup_detected?` palauttaa arvon
`true`, kutsumme metodia `actually_inject_stuff`. Muutoin se huomauttaa käyttäjälle asiasta. Emme kuitenkaan korjanneet sitä _aivan täysin_ vielä. Miksi?

Jos kuppia siirretään metodia `actually_inject_stuff` suoritettaessa, emme huomaa sitä, koska tarkistimme tilanteen vain ehtolauseen alkaessa kyselyllä `sensors.cup_detected?`. Tarkistamme nyt sentään tilanteen ennen jokaista seuraavaa vaihetta.

Mieti hetki, miten ongelma voitaisiin korjata kunnolla.


### Tosi vai epätosi

{tip-begin}
`nil` tarkoittaa yksinkertaisuudessaan _arvon puuttumista_. Esimerkiksi pyydettäessä tyhjän taulukon ensimmäistä arvoa Ruby palauttaa `nil`, koska kaikkien Ruby-kielisten lausekkeiden pitää palauttaa _jotain_. Se siis vain tarkoittaa, että arvoa ei ole olemassa.
{tip-end}

Aiemmin sanoin, että `if` suorittaa ensimmäisen haaran
vain, jos ehto on tosi. Mikä sitten on totta? Rubyssä mikä hyvänsä, jonka arvo EI ole `false` tai `nil`:

```ruby
if 0
  puts "tämä tulostuu"
end

if ""
  puts "näet myös minut"
end

if []
  puts "ja minut"
end

if nil
  puts "..mutta minua ei tulosteta!"
end
```

Ehkä yksi yleisen tapa saada jokin totuusarvo tapahtuu vertailemalla asioita. Kuten mikä hyvänsä ohjelmointikieli, Ruby tarjoaa monta tapaa siihen, ja palauttaa vastaavan totuusarvon:

```ruby
# conditions.rb
2 < 3          # true
3 < 3          # false
40 >= 38 + 2   # true
'banana' == 4     # false, huomaa kaksinkertianen '=='
'cat' == 'cat'    # true
'cat' == 'feline' # false
'cat' == 'Cat'    # false
'cute kitten' == 'cute ' + 'kitten' # true
```
{tip-begin}
Usein kuulet puhuttavan termistä "boolean", kun puhutaan asioista jotka voivat olla tosia tai epätosia. Se johtuu matemaatikko George Boolesta, ja siten ohjelmistotieteilijät puhuvat usein "Boolen logiikasta". Puhumme tästä vielä lisää siitä, kun pääsemme mutkikkaampiin ehtolauseisiin.
{tip-end}

Syy sille miksi sekä `40 >= 38 + 2` että `'cute kitten' == 'cute ' + 'kitten'`
ovat sosia johtuu tietenkin siitä, että Ruby ei vertaa keskenään _literaalia koodia_ minkä kirjoitit, vaan Ruby
_evaluoi_ (tässä vertaa lausekkeiden arvoa) vertailuoperaattorin molemmin puolin, missä operaattoreita ovat tässä esim. `==` ja `>`.

Lähes mikä hyvänsä kieliopillisesti oikea koodi mitä kirjoitat Rubyssä, on _lauseke_ (engl. expression) tai lista useita sellaisia. Jokaisella lausekkeella on jokin arvo. Esimerkiksi yksinkertaisen lausekkeen `2` arvo on vain `2`. `kitten`:in arvo on `kitten`, kuten minkä hyvänsä literaalin arvon. Lauseke `38+2` _evaluoituu_ 40:ksi, joten se on yhtä suuri arvon `40` kanssa. Samoin `'cute ' + 'kitten'` evaluoituu merkkijonoksi `'cute kitten'`.

Helppo tapa tulla sinuiksi lausekkeiden kanssa on kokeilla leikkimällä Pry:llä käyttäen erilaisia lausekkeita ja komentoja. Suositankin tekemään niin nyt, ja kokeilemaan esimerkiksi vertailuoperaatioita. Huomaa myös, että koska jokainen rivi minkä kirjoitat on lauseke, joten Pry palauttaa jokaista lauseketta kohden sen arvon, minkä Ruby lausekkeelle laskee!

### Yhteenveto

Yleiskielessä puhumme esimerkiksi "mikroaaltouunin ohjelmoinnnista" tai "ohjelmoitavasta pesukoneesta". Tässä asiayhteydessä kyse ei kuitenkaan tarkkaan ottaen ole ohjelmoinnista vaan yksinkertaisesti joidenkin komentojen _sekvensoinnista_, eli asioiden suorittamisesta peräjälkeen, joka kerta samalla tavalla.

Kun puhumme tietokoneista, tarvitsemme kolme perusasiaa, jotta voimme tehdä periaatteessa **mitä hyvänsä** (ja tarkoitan termillä mitä hyvänsä todella mitä vain, mikä on ylipäätään edes teoreettisesti mahdollista):

1. Tee joukko asioita. Ensiksi siis suorita jotain, sitten joitain muita juttuja.
2. Tee jotain ehdollisesti. Kun tämä on voimassa, tee näin. Muutoin tee jotain muuta (tai älä tee mitään)
3. Toisto

Ajattele tätä hetki: mitä pesukoneen käyttöliittymän tulisi tarjota, jos se olisi aidosti käyttäjän ohjelmoitavissa?

Seuraavaksi puhumme puuttuvast kolmannesta asiasta.

## Toistaminen

Kuvittelen, että sinulla on lista asioita tehtävinä, ja haluat muotoilla ne siististi:

```ruby
# todo.rb
todo_list = ['siivoa keittiö', 'osta maitoa', 'varaa aikaa Rubyn opetteluun', 'harkitse kissan hankkimista']

# muista, että listan indeksointi alkaa nollasta
puts "TODO item: " + todo_list[0].capitalize
puts "TODO item: " + todo_list[1].capitalize
puts "TODO item: " + todo_list[2].capitalize
puts "TODO item: " + todo_list[3].capitalize
```

Koodi tulostaisi kyllä kaikki tehtävät, mutta se näyttää tarpeettoman kankealta. Siinä on tarpeetonta toistoa, ja mieti miltä se näyttäisi, jos siinä olisi 100 tehtävää. Varmasti pystymme parempaan!

Rubyssä kaikki tietotyypit jotka voivat _sisältää_ juttuja -- ohjelmistotieteilijät puhuvat _kokoelmista_ (engl. _collections_) tai asioista, joiden yli voit _iteroida_ -- tukevat metodia _each_. Taulukot ovat kokoelmia asioista, joten voimme korvata ylläolevan huomattavasti siistimmällä versiolla:

```ruby
# todo2.rb
todo_list = ['siivoa keittiö', 'osta maitoa', 'varaa aikaa Rubyn opetteluun', 'harkitse kissan hankkimista']

todo_list.each do |entry|
  puts "TODO: " + entry.capitalize
end
```

Älä murehdi tässä vaiheessa `|` -merkeistä. Mieti ensiksi jälkimmäisen etuja: toistorakenteen `each` ansiosta meidän ei tarvitse tietää ensinkään, mikä on taulukon koko. Koodi toimisi yhtä lailla vaikka siinä olisi vain yksi tietue, 100 miljardia, tai jopa tyhjä lista; silloin se vain ei tulostaisi mitään.

Huomaa myös, että että meidän ei tarvitse toistaa muotoilua. Jos haluamme vaihtaa tiedon esitystapaa, se muutos tarvitsee tehdä vain yhdelle riville.

Puhutaan nyt hieman lisää kielen syntaksista, ts. muodollisesta kieliopista. Siihen tottuu nopeasti. Toinen esimerkki:

```ruby
# countdown.rb
puts "Lähtölaskenta alkaa"
[5, 4, 3, 2, 1].each do |n|
  sleep 0.5
  puts n
end
puts "Lähtö!"
```

`do` aloittaa _koodilohkon_ (engl. _block_). Ruby-lohko on vain pätkä Ruby-koodia siinä missä mikä hyvänsä muukin koodi. Se on olemassa enimmäkseen siksi, jotta ohjelmoija voi käsitellä useita rivejä loogisesti yhtenä kokonaisuutena. Tässä tapauksesa sekä rivit `sleep` että `puts` suoritetaan joka kerta, kun `each` käy taulukkoa läpi.

Mielenkiintoinen osa on putkimerkkien `|` välissä. Ruby automaattisesti sijoittaa vuorollaan _kunkin kokoelman alkioista_ (siitä nimi _each_) seuraavaan lohkoon, sijoittaen tämän arvon annettuun muuttujaan (nimi putkimerkkien välissä) ja suorittaa lohkon _jokaiselle kokoelman alkiolle vuorollaan_. Näin ollen kuvatussa tapauksessa `puts`:ia kutsutaan viisi kertaa, `n` saaden vuorollaan jokaisen listan arvon. Kokeile annettua koodia, ja kokeile myös muuttamalla listan arvoja.

On olemassa toisenkinlaisia toistorakenteita, joskaan ei ihan yhtä yleisiä. Tarkoitus ei ole käsitellä niitä kaikkia tässä, vain kaikkein hyödyllisimmät.

Yksi varsin tärkeä toistorakenne kykenee sekä toistoon että ehdolliseen suoritukseen tarkistaen ehdon aina ennen uuden kierroksen aloittamista. Se on hieman kuin `each` steroideilla:

```ruby
# while.rb
start_time = Time.now
while (Time.now - start_time) < 3
  puts "Minun pitäisi perehtyä tähän Rubyyn."
  sleep 0.4
end
```

Osaatko arvata, mitä ohjelma tekee? Ensiksi se tallentaa senhetkisen kellonajan muuttujaan `start_time`. Sitten se suorittaa silmukkaa niin pitkään, kunnes kellonajan ja aloitusajan ero on vähintään 3 sekuntia (`start_time` ei muutu kun se on kerran asetettu, kun taas `Time.now` palauttaa joka kerta eri arvon, koska se palauttaa senhetkisen kellonajan).

Vielä yksinkertaisemmin, koodi toistaa silmukkaa 3 sekunnin ajan, pysähtyen hieman alle puoleksi sekunniksi joka kierroksella.

Huomaa myös, että samoin kuin mikä muukin vertailu, while ei välitä ehdosta kunhan se on jotain, millä on totuusarvo. Ja Rubyssä mikä hyvänsä lauseke on tosi, paitsi jos sen arvo on `false` tai `nil`. Ehtolauseke voi tarkistaa, onko vedenpinnan korkeus vesisäiliössä jonkin rajan alapuolella, tai onko Fluffy-kissalla tarpeeksi tonnikalaa. Se voi tarkistaa onko kiertoradan periapsis riittävän korkealla, tai mitä hyvänsä. Ainoa millä on väliä on ehtolauseen paluuarvo.

Ohessa muutamia harjoituksia. Mieti jokaista riviä ja mikä on sen totuusarvo ehtolauseessa (esim. `if` tai `while`):

```ruby
2 == 2
'kissa' == "kissa"
'koira' != 'kissa'
1 < 0
3 == 12 / 4
'false'
false
''
nil
[]
0
[false]
```

On tärkeää ymmärtää, että while-silmukka toistaa koodia välillä `while` .. `end` niin pitkään kun ehto on tosi. Ehto tarkistetaan uudestaan _joka kerta_ sen jälkeen, kun silmukan viimeinen rivi on suoritettu, ja vain silloin. Silmukan suorittaminen ei lopu esim. silloin, jos ehtolauseen arvo muuttuisi epätodeksi silmukan suorittamisen aikana. Huomaa myös, että simukka on niinsanottu `ikuinen silmukka`, jos ehto ei ole koskaan epätosi. Esimerkiksi seuraava ohjelma ei koskaan lopeta suoritusta:

```ruby
while true
  puts "tämä toistuu loputtomiin"
  sleep 0.2
end
```

Ainoa tapa lopettaa ohjelma tällaisessa tilanteessa on lopettaa se pakkokeinoin. Onneksi se onnistuu tässä tapauksessa vain sanomalla terminaalissa `CTRL+C`. Voit kokeilla tätä jos haluat.

{tip-begin}
<p>Toisinaan ihmiset puhuvat "ohjelmoinnista" ja "koodaamisesta" sekaisin. Kuitenkaan esimerkiksi HTML:n kirjoittaminen ei ole ohjelmointia, vaikka sitä voidaan kutsua koodaamiseksi. Koodaaminen on väljästi vain asioiden esittämistä jossain toisessa muodossa, mikä voi olla ohjelmointia (Ruby) tai asian esittämistä jossain toisessa muodossa (HTML). Kuitenkaan koska esim. HTML:ssä ei ole ehtolauseita eikä toistoa, se ei voi olla ohjelmointikieli, eikä siten HTML:n kirjoittaminen ole ohjelmointia, vaikka se onkin koodausta. Kaikki ohjelmointi on siten koodausta, mutta kaikki koodaus ei ole ohjelmointia. Huh!
</p>

<p>
On myös varsin epämielekästä sanoa, että HTML:ssä olisi mitään "toimintoja" tai että se "suorittaisi" mitään, vaikka tietystä näkökulmasta voitaneen ajatella esim. _title_ -elementin olevan "funktio", joka näyttää dokumentin otsikon. Tavallaan. Mutta sinun pitäisi vähintäänkin irvistää hieman, jos joku sanoo niin. Mainittu virhekäsitys lienee yleinen siksi, että HTML:n sekaan voidaan upottaa kyllä ohjelmointikieltä (esim.  JavaScript), mutta JavaScript ei silti ole osa HTML:ää. Se on ohjelmointikieli.
</p>
{tip-end}

Tässä vaiheessa on hyvä vetää syvään henkeä, koska olemme saavuttaneet merkittävän etapin: tiedät nyt kaikki tarpeelliset käsitteet, mitä tarvitaan  _mielivaltaisen tietokone-ohjelman toteuttamiseen_. Luit oikein, minkä hyvänsä! Siistiä, eikö?

Isompien ohjelmien tekeminen vain näillä tiedoilla olisi melkoisen vaikeaa, mutta kuitenkin varsin mahdollista!

Voimme laskea juttuja, liittää yhteen merkkijonoja, sijoittaa arvoja muuttujiin. Voimme tehdä päätöksiä riippuen juttujen arvoista, ja voimme toistaa juttuja.

Nämä ovat _kaikkien_ tietokone-ohjelmien rakennusaineita. Kaikki muu on vain yksityiskohtia, ja em. ajatusten soveltamista.

### Yhteenveto

Opimme nyt viimeisimpänä toiston. Meillä on kahdenlaisia toistorakenteita/silmukoita:

1. `each` toimii kaikkien kokoelmien (kuten taulukko) kanssa, eikä sen kanssa tarvitse tietää kuinka monta alkiota kokoelmassa on
2. `while` toistaa silmukkaa niin pitkään, kun sen yhteydessä annettu ehtolause on tosi

`while` on sikäli ilmaisuvoimaisin, että sen avulla voidaan toteuttaa mikä hyvänsä silmukka, mutta `each` on usein kätevämpi ja tiiviimpi, kun pitää käsitellä kokoelman kaikki alkiot jotenkin.

Voisit hakea tässä vaiheessa kupin lämmintä lempijuomaasi, olet sen ansainnut! Miettien hieman samalla juuri oppimiasi asioita. Ole hyvä ja rapsuta samalla lemmikkikoiraasi tai kissaasi, jos sinulla sellainen on. Hevosen taputtaminen on ok sekin :3

[^fn-array] Jep, sisäkkäisyydellä ei ole rajaa, eli taulukko voi sisältää toisia taulukoita: `[1, [2, 3], [4, [[5], [6]]]]` ja toisinaan vielä mutkikkaammatkin taulukot ovat tarpeen.

### Harjoituksia

Allaolevissa harjoituksissa on tarpeen tietää seuraavaa:

* Toistaaksesi jotain tarkalleen n kertaa, voit sanoa `n.times { |i| # koodi, jota toistetaan n kertaa }`. `i` tässä lohkossa on laskuri, joka saa järjestyksessä vuorollaan kaikki arvot väliltä 0 .. n-1. Silmukka siis toistuu n kertaa. Huomaa, että ohjelmoidessa laskenta alkaa yleensä aina luvusta 0.
* `puts` tulostaa automaattisesti rivinvaihdon merkkijonon perään, kun taas `print` ei. `puts` ilman parametria tulostaa pelkän rivinvaihdon, mikä on toisinaan kätevää.
* `||` tarkoittaa loogista "tai"-operaatiota. Siten lauseke `if 2 > 3 || 2 > 1` on tosi, koska lausekkeen jälkimmäinen osa (2 > 1) on tosi
* `&&` on looginen "ja". Lauseke `foo && bar`on tosi vain silloin, kun sekä `foo` että `bar` ovat totuusarvoltaan tosia.

Kirjoita ohjelma, joka
{tip-begin}
Rubussä on monta tapaa toistaa asioita. `Integer#times` on näistä vain yksi (merkintä tarkoittaa, että mille vain kokonaisluvulle on olemassa metodi `times` kuten `42.times`). Samoin huomaa, että jos koodisi merkkien `{ .. }` välissä koostuu useammasta kuin yhdestä rivistä, aaltosulkeet `{}` on tapana korvata merkinnällä `do .. end`.
{tip-end}

* tulostaa 5x10 suorakaiteen käyttäen merkkiä '.'. Älä vain kopioi allaolevaa sellaisenaan, vaan käytä toistorakennetta. Tuloksen pitäisi näyttää tältä:
```
..........
..........
..........
..........
..........
```
* tulostaa täytetyn suorakaiteen siten, että pituus ja korkeus annetaan komentoriviparametreina. Esim. `ruby rectangle.rb 4 7` tulostaisi
```
  #######
  #.....#
  #.....#
  #######
```
Komentoriviparametrit voit lukea muuttujasta `ARGV`, joka on taulukko minkä Ruby luo automaattisesti juuri tätä tarkoitusta varten.
* tulosta täytetty kolmio. Ohjelman pitäisi ottaa parametrina kannan pituus / korkeus, siten että `ruby triangle.rb 8`tulostaa
```
  #
  ##
  #.#
  #..#
  #...#
  #....#
  #.....#
  ########
```
* entä jos kolmio pitäisi kääntää toisinpäin, kuten alla?
```
         #
        ##
       #.#
      #..#
     #...#
    #....#
   #.....#
  ########
```
