# Rubyn perusteet

Tervetuloa ohjelmoinnin ihmeelliseen maailmaan!

## Mitä on ohjelmointi?

Tähän on monia sinänsä hyvíä vastauksia. Itse tykkään määritellä sen seuraavasti:

{tip-begin}
Välillä näet tämänkaltaisia ohjeita. Voit sivuuttaa ne hyvin lukiessasi materiaalia ensimmäistä kertaa. Niissä on kuitenkin hyödyllistä tietoa, joihin on ehkä hyvä tutustua ainakin myöhemmin.
{tip-end}

Ohjelmointi on sitä, että annetaan tietokoneelle joukko täsmällisiä ohjeita,
miten kussakin tilanteessa tulee toimia. Kaikkien tietokoneohjelmien voidaan
katsoa toimivan kolmen perusmekanismin kautta: komentojen tai lausekkeiden
suorittamisen, näiden mielivaltaisen pitkän toistamisen ja ehdollisen
suorituksen kautta.

Tietokoneohjelmat koostuvat lopulta erittäin yksinkertaisista toiminnoista.
Ilman korkeampia abstraktiotasoja nykyisten mutkikkaiden ohjelmien kehittäminen
ja ylläpitäminen on kuitenkin lähes mahdotonta, joten kaikki yleisemmät
ohjelmointikielet tarjoavat erinäisiä keinoa luoda korkeamman tason
abstraktioita. Näistä sitten voidaan koostaa yhä mutkikkaampia vielä korkeamman
tason abstraktioita, jotka lopulta sitten toteuttavat koko järjestelmän.

Tämän oppaan tarkoituksena on selvittää lukijalle edellämainitut
kolme perusmekanismia, sekä tarjota myöhemmin keskeisimpiä työkaluja mutkikkuuden hallintaan.

### Miksi jälleen uusi opas?

Maailma on täynnä monia parempia oppaita, mutta niistä lyhimmätkin ovat
mielestäni liian pitkiä.
[Why The Lucky Stiff:in](http://mislav.uniqpath.com/poignant-guide/book/chapter-1.html) opas
on erinomainen ja kaukana kuivasta, mutta se on pitkä (suosittelen kuitenkin!).

Pyrkimykseni on esitellä pienin tarvittava määrä tietoa, jotta ohjelmoinnissa
voisi päästä alkuun. Luotan siihen, että puuttuvat osat on helppo selittää sitä
mukaa kun niitä tarvitaan. Aloitetaan siis!

### Käytetyt merkinnät

Mikä hyvänsä, joka näyttää sellaiselta kuin

```ruby
# somefile.rb
puts "Howdy" # tässä meillä on Ruby-koodia
```

voidaan kirjoittaa suoraan ruby-kehotteeseen. Silloin Ruby _tulkitsee_ ja suorittaa kirjoittamasi koodin.


{tip-begin}
<p>ruby-kehote tai ruby-tulkki (_engl. interpreter_) tarkoittaa kehotetta, mikä tulee Ruby-asennuksessa mukana. Sen saa esille komennolla `irb` tai `pry`, ks. kohta "Työkalut".</p>

<p>Tyypillisesti tällaisissa oppaissa on lyhyt kuvaus siitä, miten Ruby asennetaan, ja miten komentokehotetta käytetään. Näistä on hyviä oppaita verkossa vaikka kuinka, joten en käsittele niitä tässä. Komentokehote löytyy Windows-ympäristössä nimellä "Command prompt" (cmd.exe), Macissa ja Linuxissa nimellä "Terminal".</p>

<p>Hakusanoilla "installing Ruby for X" missä X on käyttöjärjestelmäsi (Linux, Mac, Windows tai joku muu) löytyy paljon hyviä asennusohjeita. Hieman jäljempänä on kuitenkin lyhyt ohje asentamiseen Mac- tai Linux-ympäristössä.
</p>
{tip-end}

Jos kirjoitettua koodia on luontevampi suorittaa tallentamalla koodi ensiksi tiedostoon (esimerkiksi siksi, että koodilistaus on pitkä), ehdotan tiedostonimeä ohjelmalistauksen alussa. Ylläolevassa esimerkissä ehdotan tiedostolle nimeä `somefile.rb`. Voit käyttää mitä hyvänsä muuta nimeä, mutta huomioi tämä myöhemmin suoritat ohjelmaa. Tiedostopääte `.rb` ei ole pakollinen, mutta se on yleisesti käytetty merkintätapa Ruby-kielisille ohjelmille (ja siten suositeltava).

Teksti, joka on muotoa

> cd projects/ruby-tutorial

on taas tarkoitettu kirjoitettavaksi käyttöjärjestelmän terminaaliin, **ei** siis ruby-kehotteeseen. Nämä ovat komentoja, millä kerrot tietokoneen _käyttöjärjestelmälle_, mitä haluat tehdä. Huomaa myös, että '$' jää automaattisesti kopioidusta tekstistä pois (kuten pitääkin), jos kopioit tekstin leikepöydälle. Copy-pasten pitäisi siis toimia mutkattomasti.

### Työkalut

Mikä hyvänsä **tekstieditori** käy Ruby-kielisten ohjelmien kirjoittamiseen (_ei siis_ Word tai vastaavat, ne ovat ohjelmia, joilla käsitellään muotoiltua tekstiä; koodieditorit tallentavat merkit 'sellaisenaan'), mutta jos kokemusta ohjelmoinnista on vähän, suosittelen lämpimästi Atom-editoria (https://atom.io/). Se on helppokäyttöinen, mutta silti riittävä jopa ammattikäyttöön.

Lyhyiden ohjelmapätkien kokeiluun kannattaa käyttää joko Ruby-asennuksen mukana tulevaa tulkkia eli `irb`-työkalua (interactive Ruby interpreter). Hieman parempi työkalu samaan tarkoitukseen on **Pry**, jonka asentamiseen ohjeet hieman alempana.

{tip-begin}
Ohjelmointikielet ovat yleensä joko käännettäviä tai tulkattavia. Molemmissa on etunsa. Tulkattavan kielen hyvä puoli on siinä, että sellaisia kieliä voidaan suorittaa suoraan ilman erillistä käännösvaihetta. Yleensä tällaisissa kielissä tulee myös mukana _interaktiivinen tulkki_, jolla voi helposti kokeilla ohjelman eri osia erikseen. Ruby on tulkattava ohjelmointikieli.
{tip-end}

Suosittelen samoin pitämään ainakin kolmea ikkunaa avoinna samanaikaisesti kirjoittaessasi ohjelmia. Keskeisin näistä on
tekstieditori (esim. Atom), jolla enimmäkseen kirjoitat koodia. Sen lisäksi pidän auki kahta komentokehoitetta, joista toisessa ajan ruby-komennolla kirjoittamiani ohjelmia. Toisessa taas on jatkuvasti pry auki, jolla voin kokeilla nopeasti pienten koodinpätkien toimivuutta. Näin minun ei tarvitse välissä sulkea ja avata ohjelmia, vaan kaikki on heti valmiina käyttöä varten.

Näiden lisäksi on suositeltavaa pitää auki selainikkunaa, jossa on avoinna kielen dokumentaatio. Valitettavasti yhtä mukavaa sivua josta löytyisi kaikki tarvittava en ole löytänyt, mutta Rubyn tarjoamat toiminnot voidaan jakaa kahteen osaan: [kielen sisäänrakennetut toiminnot](http://docs.ruby-doc.com/docs/ProgrammingRuby/html/builtins.html) jotka ovat aina käytettävissä, ja toiseksi [vakiokirjasto](http://docs.ruby-doc.com/docs/ProgrammingRuby/html/lib_standard.html), joka tulee automaattisesti mukana asennettaessa, mutta täytyy ottaa käyttöön erikseen. Esimerkiksi jos tarvitset kompleksilukuja, sinun täytyy ensiksi sanoa `require 'complex'` Ruby-ohjelmasi alussa.

**Ruby-kielen** tulkki saattaa myös olla järjestelmässäsi jo valmiiksi asennettuna. Jos komento

> ruby -v

palauttaa versionumeron 1.9.3 tai enemmän, niin hyvä; tässä oppaassa kuvattujen ohjelmien pitäisi toimia vallan mainiosti. Jos Rubyä ei löydy tai haluat asentaa sen itse, suositan versiota 2.3.0 tai uudempaa.

Jos käytät OS X:ää (Mac OS) tai Linuxia, RVM tai rbenv on hyvä ja helppo tapa asentaa Ruby. Voit asentaa RVM:n komennolla

> curl -sSL https://get.rvm.io | bash -s stable --ruby

Asentaaksesi Pry:n ja muutaman muun mukavan työkalun, suorita

> curl -sSL http://bit.ly/1LaIHjX | bash

Jos taas haluat asentaa mainitut työkalut käsin tai curl-komento ei ole saatavilla (esim. Windows), komento

> gem install -q --no-ri --no-rdoc pry pry-doc pry-coolline awesome_print

asentaa muutaman mukavan aputyökalun. Kokeile vaikka pry-komentoa sanomalla komentokehoitteessa

> pry

ja sitten esim. `puts "Whee! My first Ruby program"; exit`

Tuo lyhyt koodi tulostaa näytölle kuvatun tekstin, jonka jälkeen `exit`
poistuu pry-tulkista (ts. sulkee käynnissä olevan ohjelman). Sitten oletkin valmis aloittamaan
koodauksen!

{tip-begin}
Yleisesti haluat välttää ajamasta sokkona netistä löytyviä mielivaltaisia skriptejä. Voit tietenkin tarkistaa molempien linkkien sisällön, näistä jälkimmäinen bit.ly -skripti on minun kirjoittamani.
{tip-end}

## Tietotyypit

Kaikki ohjelmat koostuvat vain kahdesta asiasta: *datasta* (tieto/informaatio) ja *funktioista*, jotka tekevät juttuja sille informaatiolle. Tarkastellaan lähemmin hyvin yksinkertaista ohjelmaa jossa on molempia, ja joka tekee jotain järkevää suoritettaessa.

```ruby
# hello.rb
puts "Oi, uunituoreita kanelipullia!"

puts "Kissanpennut ovat niin " + " pörröisiä"
puts "enemmän kissoja esimerkkeihin!1!1one!".upcase
```

Voit suorittaa ylläolevan ohjelman komennolla

> ruby hello.rb

Data on vain tietoa kuten tekstiä, numeroita, kuvia ja videoita. Se ei tee itsessään mitään. Jopa yksinkertainen teksti pitää tulostaa, ennenkuin se voidaan lukea. Tässä esimerkissä **merkkijono** `"Oi, uunituoreita kanelipullia!"` on dataa, kuten myös `"Kissanpennut ovat niin "` sekä `"pörröisiä"`.

`puts` taas on funktio, joka _tekee tiedolle jotain_, tässä siis tulostaa mitä hyvänsä tekstiä sille annetaan. `upcase` on myös eräänlainen funktio, joka on "sidottu" vain merkkijonoihin. Koska sitä voi kutsua vain merkkijonoille, se kirjoitetaan tiedon perään pisteellä erotettuna. Hyvä tapa ajatella tätä on siten, että lähetämme _viestin_ `upcase` merkkijonolle, ja paluuviesti on samanlainen merkkijono, mutta isoilla kirjaimilla.

Kun puhumme merkkijonoista, tarkoitamme käytännössä tekstiä erotuksena esim. luvuille: `1` on luku johon voi lisätä, kertoa sitä toisella luvulla jne, kun taas `"1"` on merkkijono. Lauseke `"1" + 2` ei ole järkevä Ruby-kielessä (ja hyvä niin), koska lukuja ja merkkijonoja ei voi laskea yhteen. Rubyssä ilmaisu `"1" + 2` on yhtä järkevä kuin `"kissa" - 5` -> does not compute.

Huomaa myös, että ohjelmarivien välissä voi olla haluamasi määrä tyhjiä rivejä. Samoin kuin luonnollisessa kielessä, tyhjillä riveillä voit erottaa loogisesti hieman eri asiat toisistaan. Ruby ei tästä välitä: voit kirjoittaa kaikki Ruby-ohjelmat halutessasi jopa yhdelle (hyvin pitkälle) riville. Ylimääräiset välilyönnit ja rivinvaihdot ovat vain luettavuuden vuoksi eli ihmistä varten, kone jättää ne huomioimatta.

Muuten, huomaa että kun puhun tulostamisesta, tarkoitan sillä vain näytölle tulostamista. Et tarvitse näissä harjoituksissa tulostinta tai paperia :)

Esimerkki tyhjien rivien käytöstä luettavuuden helpottamiseksi:

```ruby
# greeting.rb
class FriendlyGreeter
  def say_hello(name)
    launch_ze_missiles('<some random country>')

    "Hulloooo, #{name}! Hope you are having an awesome day!"
  end

  def launch_ze_missiles(target_country)
    puts "But i am lé tired :-<"
  end
end

puts FriendlyGreeter.new.say_hello("Jill")
```

Voit taas kokeilla ohjelmaa joko kopioimalla sen pry-tulkkiin, tai tallentamalla sen tiedostoon greeting.rb, ja sanomalla

> ruby greeting.rb

Jatkossa en erikseen sano, miten ohjelman voi suorittaa. Tämä tapahtuu aina komennolla `ruby foo`, missä `foo` on tiedoston nimi, johon ohjelma on kirjoitettu.

Huomasithan, että merkkijonot Rubyssä pitää aina ympäröidä sitaateilla, joko kaksin- (`"`) tai yksinkertaisilla (`'`). Tässä vaiheessa ei ole väliä kumpaa muotoa käytät, mutta käytä mieluusti jompaa kumpaa johdonmukaisesti.

Tekstin lisäksi pitää käsitellä usein **numeroita**. Esimerkkejä:

```ruby
# numbers.rb
puts 1 + 2

# Huom! se on (30 / 3) + 4, ei 30 / (3 + 4). Ihan kuten koulussakin
puts 30 / 3 + 4

puts 10 / 3.0    # 3.3333333...
puts 10 / 3      # 3 -- jakolasku kokonaisluvuilla, koska jakaja ja jaettava ovat kokonaislukuja
puts 10.divmod 3 # [3, 1]
```

Nyt tiedämme numeroista ja merkijonoista. Mitä jos meillä on jotain monta kappaletta? No sitä varten on listat. Tai Rubyssä puhumme yleensä _taulukoista_. Niiden avulla voi tehdä monenlaisia asioita, ja ne ovat varsin keskeisiä oikeastaan kaikissa ohjelmissa:

```ruby
# arrays.rb
some_stuff = ['kitten', 'dog', 'llama']

puts some_stuff        # tulostaa kunkin merkkijonon omalle rivilleen
puts some_stuff.length # 3, koska listassa 3 alkiota

# lähes kaikki ohjelmointikielet aloittavat taulukon
# indeksoinnin nollasta, joten 1. alkio on löytyy indeksistä 0!
puts some_stuff[0]     # kitten
puts some_stuff[1]     # dog
puts some_stuff[2]     # llama
puts some_stuff[-1]    # -1 tarkoittaa viimeistä alkiota => llama

puts some_stuff.sort   # tulostaa dog, kitten ja llama tässä järjestyksessä

# Taulukot voivat sisältää erilaisia tietotyyppejä
puts ['dog', 42].length

# Yow dawg, heard you like arrays so I put array in your array
not_even_funny = [2, ['bananas'], [4, 5]]

# tulostaa sekä 4 että 5, koska viimeinen alkio on taulukko [4, 5]
puts not_even_funny[-1]
```

Taulukon sisältöön viitataan siis numeerisilla indekseillä (~osoite) siten, että indeksissä 0 on aina taulukon 1 alkio. Taulukossa jossa on n alkiota viimeinen indeksi on siten n-1.

Olet ehkä jo arvannut, että Ruby ei huomioi rivejä, jotka alkavat merkillä `#`. Ne ovat _kommentteja_. Tietokone hyppää niiden ohi samoin kuin välilyöntien, ja ne on tarkoitettu vain koodia lukeville ihmisille.

Nyt siis meillä on _merkkijonoja_ (tekstiä), _numeroita_ ja _taulukoita_. Olemme myös nähneet muutamia funktioita. Mutta miksi jotkut niistä funktioista ovat tietoja ennen, kuten `puts`, ja jotkut tietojen jälkeen pisteen kera, kuten `length`? Jälkimmäinen on esimerkki _metodista_. Voit ajatella metodia funktiona, joka on tiiviisti sidottu johonkin tietoon -- esimerkiksi funktiota `puts` voi kutsua minkätyyppisille tiedoille hyvänsä, kun taas `upcase` toimii vain merkkijonoille. Tässä vaiheessa sillä ei ole niin merkitystä puhutaanko funktioista vai metodeista. Oleellista on se, että molemmat tekevät asioita tiedolle -- muuntavat sitä, tallentavat sen johonkin (kuten kirjoittaminen tiedostoon), laskevat asioita jne. Usein ne palauttavat jonkin arvon, joka on tuotettu jollain tavalla funktiolle annetuista arvoista.

Näimme jotain muutakin. Koodissa oleva `some_stuff` on _muuttuja_. Niitä
käytetään esimerkiksi antamaan käsitteille kuvaavia nimiä, välttämään
tarpeetonta toistoa silloin, kun jonkin laskeminen on verrattain aikaavievää,
tallentamaan nykyinen tila jne.

Seuraava esimerkki on toiston välttämisestä:

```ruby
if (5/9.0) * (77 - 32) > 24
  puts "It's quite warm, #{(5/9.0) * (77 - 32)}°C!"
else
  puts "meh, I'll play games at home"
end
```

Edelläolevassa esimerkissä toistuu tarpeettomasti lauseke, jolla Fahrenheit-lukema 77 muunnetaan Celsius-asteiksi.
Sama onnistuu huomattavasti mukavammin käyttämällä sopivaa muuttujaa:

{tip-begin}
Usein haluamme rakentaa merkkijonoja siten, että osa siitä rakennetaan ohjelmallisesti. Koodi
`#{(5/9.0) * (77 - 32)}` ei tulostu sellaisenaan, vaan Ruby
'purkaa' merkkien `#{}` sisällä oleva arvon ennen sen sijoittamista osaksi merkkijonoa. Tällöin
tulee käyttää kaksoislaunausmerkkejä `"..."` -- lauseke `puts '1 + 0 = #{1 + 0}'` _ei_ tulosta `1 + 0 = 1`, vaan
se tulostaisi kirjaimellisesti `1 + 0 = #{1 + 0}`.
{tip-end}

```ruby
degrees_celcius = (5/9.0) * (77 - 32)

if degrees_celcius > 24
  puts "It's quite warm, #{degrees_celcius}°C!"
else
  puts "meh, I'll play games at home"
end
```

Jälkimmäinen versio on siinäkin mielessä paljon parempi, että jos lukema 77 muuttuu, muutos tarvitsee tehdä vain yhteen paikkaan. Toinen hyvin yleinen syy muuttujien käyttöön on asioiden nimeäminen, jotta koodista tulee luettavampaa. Katsotaanpa lähemmin seuraavaa:

```ruby
users.select { |u| !u.admin? && u.created >= Time.now - 7.days }.each do |u|
  puts "User: " + u
end
```

Ellei lukija ole entuudestaan kokenut niin Railsin kuin Rubyn suhteen, koodista ei ole kovinkaan helppoa nähdä mitä oikeastaan tulostetaan. Tarkastellaan seuraavaksi versiota, joka jakaa toiminnallisuuden kahteen osaan käyttäen samalla kuvaavia muuttujanimiä:

```ruby
min_creation_time = Time.now - 7.days
recent_non_admins = users.select { |u| !u.admin? && u.created >=  min_creation_time }

recent_non_admins.each do |user|
  puts "User: " + user
end
```

Koodin voisi kirjoittaa vieläkin siistimmin, mutta meillä ei ole vielä siihen työkaluja. Saavutimme kuitenkin jo jotain tärkeää:
`recent_normal_users` kertoo lukijalle, että muuttuja sisältää taulukon hiljattain luotuja käyttäjiä, jotka eivät ole järjestelmän ylläpitäjiä (non_admins). Jos haluat vain muuttaa käyttäjien tulostamista, voit hyvin jättää huomiotta mutkikkaamman lausekkeen jolla käyttäjät luetaan muuttujaan, samoin sen miten se tarkkaanottaen tapahtuu. Voit keskittyä vain siihen osaan, missä käyttäjät tulostetaan.

Termi muuttuja voi tuntua vähän hassulta, jos kerran muuttujan sisältämä arvo on koko ajan sama. Nimi tuleekin juuri siitä, että muuttujan sisältämä arvo voi muuttua. Esimerkiksi lauseke `kissan_nimi = 'Fluffy the Cute One'` sijoittaa muuttujaan `kissan_nimi` arvon `Fluffy the Cute One`. Jos `kissan_nimi` oli aiemmin jotain muuta, muuttujalla on nyt uusi arvo. Yksinkertainen esimerkki:

```ruby
thing = 'Banana, naturally'
puts "Thing is now #{thing}"

thing = 'cute kitteh'
puts "Thing is now #{thing}"
```

Vaikka tulostuslausekkeet ovat tismalleen samanlaiset, ensimmäinen tulostaa
jotain muuta kuin jälkimmäinen. Huomaa myös, että sijoittaminen ensimmäistä
kertaa (muuttujan "luominen") tapahtuu ihan samaan tapaan kuin olemassaolevan
muuttujan arvon muuttaminen. Ruby ei välitä: yhtäsuuruusmerkkiä `=` käyttämällä
kerrot Ruby-kielellä, että tämä tarkoittaa nyt tätä.

### Luettavuudesta

Tietokoneohjelmien kirjoittaminen on vaikeaa, mutta lukeminen on vielä
vaikeampaa, jopa oman ohjelmakoodin. Jo muutaman viikon kuluttua on helppo
unohtaa mitä jokin kohta koodissasi oikein tekee. Jotkut puhuvat hyvin
kommentoidusta koodista, mutta vielä tärkeämpää on kirjoittaa luettavaa
koodia. Kommenttien ongelma on siinä, että ohjelmointikielten tulkit ja
kääntäjät _jättävät ne huomioimatta_, ja siten ne jäävät myös helposti
päivittämättä. Koodi, jossa kommentit ovat vanhentuneita ja harhaanjohtavia on
huonompaa kuin koodi, jossa ei ole kommentteja. Tätä ongelmaa voi välttää
paljolti käyttämällä hyviä (kuvaavia) nimiä kirjoittamilleen asioille. Usein puhutaan
_itsedokumentoivasta_ koodista (engl. self-documenting code).

Kommentit ovat toisinaan tarpeellisia asioiden selittämiseksi tai
muistutukseksi, mutta niitä tarvitaan verrattain harvoin, jos nimeät asiat
hyvin. Kun siis kirjoitat kommentin muotoa "tämä tekee foo jos bar", niin mieti
ensin voisitko nimetä koodisi siten, että kommentti muuttuisi tarpeettomaksi.

Voiko nimet valita sitten täysin vapaasti? Käytännössä kyllä. Kaikki
muuttujanimet ovat täysin mielivaltaisia -- kone ei niistä ymmärrä mitään. Siinä
missä esim. `a` ja `z` eivät ole järin kuvaavia, ne ovat ihan kelvollisia
(kielen näkökulmasta) nimiä muuttujille. Niin on myös

`a_really_funny_kissa_with_hayfever_danced_over_the_shiny_rainbow`.

Muuttujien nimiin ei siis liity minkäänlaista merkitystä. Tietokone näkee vain
jonon symboleita, tai ei tarkemmin edes niitä, vaan sarjan numeroita (koska
tietokone käsittelee aivan kaikkea numeerisesti). Koodi `a = 1; b = 2; a + b`
toimii _tismalleen_ samalla tavalla kuin `sad_panda = 1; möhköfantti = 2; sad_panda + möhköfantti`.
Muuttujien nimet ovat lukijaa varten.

#### Säännöt asioiden nimeämiselle

Kaikki nimet ovat Rubyn näkökulmasta kelvollisia, kunhan se koostuu kirjaimista `'a'..'z'`, numeroista `0..9` ja alaviivasta `_`. Ainoa rajoite nimille on, että se ei voi _alkaa_ numerolla. Toisin sanoen `kitteh_42` on kelvollinen nimi, kun taas `42_kitteh` ei ole. Sama sääntö koskee myös metodeja ja funktioita.

{tip-begin}
<p>
Rybyssä alaviivaa käytetään sanojen erottamiseen. Käytä aina pieniä kirjaimia. ISOT_KIRJAIMET ja ns. "CamelCaseNamingConvention" on varattu vakioille, luokille ja muille asioille, joista puhumme myöhemmin.</p>

<p>On myös _mahdollista_ käyttää suomenkieltä asioiden nimeämiseen jos haluat. Se on aivan mahdollista siksikin, että ns. UTF-merkistö on yleistynyt ohjelmointikielienkin joukossa. Näinollen esimerkiksi muuttujanimi `ämpäri` on nykyään mahdollinen, toisin kuin vielä vuosikymmen sitten. Kaikki kielet eivät vieläkään sallisi muita kirjaimia kuin a..z. En kuitenkaan suosittele sitä, koska englanninkieli on selvästikin ohjelmointikielten _lingua franca_, yleiskieli. Minkä hyvänsä muun luonnollisen kielen käyttö tulee herättämään yleistä pahennusta, ja muut tulevat mulkoilemaan sinua sillä silmällä. Tiedäthän, nenänvartta pitkin ja silleen. Valinta on kuitenkin sinun :)</p>
{tip-end}

### Yhteenveto

Nyt siis tiedämme -- tai olemme ainakin nähneet -- kolmenlaisia asioita:

1. Data (tieto, informaatio). Tietotyyppejä on erilaisia, ja olemme tavanneet näistä kolme. Vastaavat Ruby-tyypit sulkeissa:
  * Merkkijonot (String)
  * Numerot (Fixnum, Float)
  * Taulukot (Array), jotka voivat sisältää mitä vain tietotyyppejä, mukaanlukien taulukoita[^fn-array]
2. Funktioita/metodeja, joilla tiedolle voidaan tehdä operaatioita
  * Edellisessä esimerkissä käytettiin _taulukkometodeja_ pituuden hakemiseen (`length`), ja `sort` palautti siihen liittyvän taulukon, aakkosjärjestyksessä. `upcase` taas palautti merkkijonon isoilla kirjaimilla.
3. Tutustuimme pintapuolisesti muuttujiin, jotka ovat vain nimiä asioille tietokoneen muistissa

## Älykäs toiminta

Kuvittele ohjelmoivasi robottia, joka jauhaa ja tarjoilee kahvia. Sellaista oikein hyvää kahvia, jossa on päällä vähän
kermaa, kanelia ja suklaalastuja sekä ripaus sokeria pinnalla. Ja kardemummaa. Ei saa unohtaa kardemummaa.

Kuvittele myös, että osaisin oikeasti piirtää kuvia, ja tässä olisi kiva, taiteellinen kuvitus missä joviaali robottimme tarjoilee kupposen kuumaa kahvia. No niin.

Oletetaan, että samainen robotti on ohjelmoitu tarjoamaan täsmälleen 80cl kahvia ja 40cl kermaa jokaiseen kupilliseen. Koodi saattaisi näyttää tällaiselta:

```ruby
bot = Robot.new("Jeeves the Valiant Valet")

bot.pour_coffee(800) # Robottimme käyttää ehkä millilitroja nesteiden yksikköinä
bot.spray_whipped_cream(400)
bot.sprinkle_chocolate_chips(5) # grammoja luultavasti
bot.sprinkle_cinnamon(1) # grammoja nämäkin (mikä on kanelin LD50???)
bot.frost_with_sugar
bot.lotsa_cardamom(100)  # ...
```

Jos kaikki on hyvin, metallinen ystävämme surisisi iloisesti ympäriinsä hyvää kahvia tarjoillen. Kaikki tähän mennessä hyvin.

Nyt kuvittele, että joku raasu tönäisisi vahingossa kahvikuppia. Silloin tuo kiehuvan kuuma neste päätyisi lattialle sotkien mattosi, tai vielä pahempaa, se voisi satuttaa pörröistä [skottilaskostasi](http://www.scottishfoldlove.com/) :( Mitä tehdä?

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
`true`, kutsumme metodia `actually_inject_stuff`. Muutoin se huomauttaa käyttäjälle asiasta. Emme kuitenkaan korjanneet sitä _ihan_ vielä. Miksi?

Jos kuppia siirretään metodia `actually_inject_stuff` suoritettaessa, emme huomaa sitä, koska tarkistimme tilanteen vain ehtolauseen alussa. Voimme tehdä tämän vielä paremmin, mutta tarvitsemme siihen vielä if-lausetta kehittyneempiä rakenteita.

### Tosi vai epätosi

{tip-begin}
`nil` tarkoittaa yksinkertaisuudessaan _arvon puuttumista_. Esimerkiksi pyydettäessä tyhjän taulukon ensimmäistä arvoa Ruby palauttaa `nil` koska kaikkien Ruby-kielisten lausekkeiden pitää palauttaa _jotain_. Se siis vain tarkoittaa, että arvoa ei ole olemassa.
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

Yleisen tapa tuottaa jokin totuusarvo tapahtuu vertailemalla asioita. Esimerkkejä:

```ruby
# conditions.rb
2 < 3          # true
3 < 3          # false
40 >= 38 + 2   # true
'banana' == 4  # false, huomaa kaksinkertainen '=='
foo = 5        # sijoitus muuttujaan 5, ei vertailu!
foo == 5       # vertailu, true, koska foo:n arvo on viisi
'cat' == 'cat'    # true
'cat' == 'feline' # false
'cat' == 'Cat'    # false
'cute kitten' == 'cute ' + 'kitten' # true
```
Syy sille miksi sekä `foo == 5` että `'cute kitten' == 'cute ' + 'kitten'`
ovat tosia johtuu tietenkin siitä, että Ruby ei vertaa keskenään _literaalia koodia_ minkä kirjoitit, vaan Ruby
_evaluoi_ eli laskee vertailuoperaattorin molemmin puolin olevan lausekkeen arvon. Vertailuoperaattoreita ovat tässä esim. `==` ja `>`.

{tip-begin}
Usein kuulet puhuttavan termistä "boolean", kun puhutaan asioista jotka voivat olla tosia tai epätosia. Se johtuu matemaatikko George Boolesta, ja siten ohjelmistotieteilijät puhuvat usein "Boolen logiikasta". Puhumme tästä vielä lisää siitä, kun pääsemme mutkikkaampiin ehtolauseisiin.
{tip-end}

Lähes mikä hyvänsä kieliopillisesti oikea koodi mitä kirjoitat Rubyssä, on _lauseke_ (engl. expression) tai lista useita sellaisia. Jokaisella lausekkeella on jokin arvo. Esimerkiksi yksinkertaisen lausekkeen `2` arvo on vain `2`. `"kitten"`:in arvo on `"kitten"`, kuten minkä hyvänsä literaalin arvo on sama kuin itse literaali. Lauseke `38+2`, joka koostuu kahdesta numeerisesta literaalista, _evaluoituu_ 40:ksi. Se on siten yhtä suuri literaaliarvon `40` kanssa. Helpommin sanottuna tulkki vertailee lausekkeiden arvoja,
ei sitä miten ne on kirjoitettu.

Helppo tapa tulla sinuiksi lausekkeiden kanssa on kokeilla leikkimällä Pry:llä, käyttäen erilaisia lausekkeita ja komentoja. Suositankin tekemään niin nyt, ja kokeilemaan esimerkiksi vertailuoperaatioita. Huomaa myös, että koska jokainen rivi minkä kirjoitat on jonkinlainen lauseke, joten Pry palauttaa jokaisella rivillä jonkin arvon. Jos lausekkeella ei ole mielekästä arvoa (kuten tulostettaessa tekstiä), arvo on `nil`.

### Yhteenveto

Yleiskielessä puhumme esimerkiksi "mikroaaltouunin ohjelmoinnnista" tai "ohjelmoitavasta pesukoneesta". Tässä asiayhteydessä kyse ei kuitenkaan tarkkaan ottaen ole ohjelmoinnista vaan yksinkertaisesti joidenkin komentojen _sekvensoinnista_, eli asioiden suorittamisesta peräjälkeen, joka kerta samalla tavalla.

Kun puhumme tietokoneista, tarvitsemme kolme perusasiaa, jotta voimme tehdä periaatteessa **mitä hyvänsä** (ja tarkoitan termillä mitä hyvänsä todella mitä vain, mikä on ylipäätään edes teoreettisesti mahdollista):

1. Tee joukko asioita. Ensiksi suorita jotain, sitten joitain muita juttuja.
2. Tee jotain ehdollisesti. Kun tämä on voimassa, tee näin. Muutoin tee jotain muuta (tai älä tee mitään)
3. Toisto

Ajattele tätä hetki: mitä toimintoja ja millaisen käyttöliittymän mikroaaltouunin tulisi tarjota, jos se olisi aidosti käyttäjän ohjelmoitavissa, siis jos ohjelmoitavuus tarkoittaisi samaa kuin em. 3 asiaa?

## Toistaminen

Kuvittele, että sinulla on lista asioita tehtävinä, ja haluat muotoilla ne siististi:

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

Rubyssä kaikki tietotyypit jotka voivat _sisältää_ juttuja -- ohjelmistotieteilijät puhuvat _kokoelmista_ (engl. _collections_) tai asioista, joiden yli voit _iteroida_ -- tukevat metodia `each`. Taulukot ovat kokoelmia asioista, joten voimme korvata ylläolevan huomattavasti siistimmällä versiolla:

```ruby
# todo2.rb
todo_list = ['siivoa keittiö', 'osta maitoa', 'varaa aikaa Rubyn opetteluun', 'harkitse kissan hankkimista']

todo_list.each do |entry|
  puts "TODO: " + entry.capitalize
end
```

Älä murehdi tässä vaiheessa merkinnästä `|..|`. Nyt toistorakenteen `each` ansiosta meidän ei tarvitse tietää ensinkään, mikä on taulukon koko. Koodi toimisi yhtä lailla vaikka siinä olisi vain yksi tietue, 100 miljardia, tai jopa tyhjä lista; silloin se vain ei tulostaisi mitään.

Samoin jos haluamme vaihtaa tiedon esitystapaa, se muutos tarvitsee tehdä vain kerran yhdelle riville, ja muutos vaikuttaa
jokaiseen tulostettavaan riviin.

Puhutaan nyt hieman lisää kielen syntaksista, ts. Rubyn kieliopista. Siihen tottuu nopeasti. Toinen esimerkki:

```ruby
# countdown.rb
puts "Lähtölaskenta alkaa"
[5, 4, 3, 2, 1].each do |n|
  sleep 0.5
  puts n
end
puts "Lähtö!"
```

`do` aloittaa _koodilohkon_ (engl. _block_). Ruby-lohko on vain pätkä Ruby-koodia siinä missä mikä hyvänsä muukin koodi. Se on olemassa enimmäkseen siksi, jotta ohjelmoija voi käsitellä useita rivejä loogisesti yhtenä kokonaisuutena. Tässä tapauksesa sekä rivit `sleep` että `puts` suoritetaan joka kerta, kun `each` käy taulukkoa läpi; `do..end` rakenne kertoo, mikä kaikki osa koodia suoritetaan
osana toistorakennetta. Koodi `puts "Lähtö!"` suoritetaan vain kerran, koska se ei ole enää osa `each`ia.

Mielenkiintoinen osa on putkimerkkien `|..|` välissä. Ruby automaattisesti sijoittaa vuorollaan _kunkin kokoelman alkioista_ (siitä nimi _each_) annettuun muuttujaaan (nimi putkimerkkien välissä), ja välittää sen lohkolle. Lohko saa siis _jokaisen kokoelman alkion_  vuorollaan, annetussa järjestyksessä. Näin ollen kuvatussa tapauksessa `puts`:ia kutsutaan viisi kertaa, `n` saaden kaikki arvot 5, 4, 3, 2 ja 1. Kokeile annettua koodia, ja kokeile sitä myös muuttamalla listan arvoja. Voit myös korvata koko listan range-tyyppisellä rakenteella, jolloin sinun ei tarvitse luetella kaikkia arvoja: esim `(1..10).reverse_each` (sama kuin each, mutta tuottaa rangen arvot käänteisessä järjestyksessä).

On olemassa muitakin toistorakenteita, joskaan ei ihan yhtä yleisiä. Tarkoitus ei ole käsitellä niitä kaikkia tässä, vain kaikkein hyödyllisimmät.

Yksi varsin tärkeä toistorakenne kykenee sekä toistoon että ehdolliseen suoritukseen tarkistaen ehdon aina ennen uuden kierroksen aloittamista. Se on hieman kuin `each` steroideilla:

```ruby
# while.rb
start_time = Time.now
while (Time.now - start_time) < 5
  puts "Minun pitäisi perehtyä tähän Rubyyn."
  sleep(rand)
end
```

Osaatko arvata, mitä ohjelma tekee? Ensiksi se tallentaa senhetkisen kellonajan muuttujaan `start_time`. Sitten se suorittaa silmukkaa niin pitkään, kunnes kellonajan ja aloitusajan ero on vähintään 5 sekuntia (`start_time` ei muutu kun se on kerran asetettu, kun taas `Time.now` palauttaa joka kerta eri arvon, koska se palauttaa senhetkisen kellonajan).

Vielä yksinkertaisemmin, koodi toistaa silmukkaa 5 sekunnin ajan, pysähtyen satunnaiseksi ajaksi joka kierroksella. Koska `rand` palauttaa ilman parametreja satunnaisluvun väliltä `0.0 .. 1.0`, ohjelma nukkuu kierrosten välissä keskimäärin 0.5 sekuntia.

Huomaa myös, että samoin kuin mikä muukin vertailu, `while` ei välitä ehdosta kunhan se on jotain, millä on totuusarvo. Rubyssä mikä hyvänsä lauseke on tosi, kunhan sen arvo on _muuta_ kuin `false` tai `nil`. Ehtolauseke voi tarkistaa, onko vedenpinnan korkeus vesisäiliössä jonkin rajan alapuolella, tai onko Fluffy-kissalla tarpeeksi tonnikalaa. Se voi tarkistaa onko kiertoradan periapsis (matalin piste) riittävän korkealla, tai mitä hyvänsä. Ainoa millä on väliä on ehtolauseen paluuarvo.

Ohessa muutamia harjoituksia. Mieti jokaista riviä ja mikä on sen totuusarvo ehtolauseessa (esim. `if` tai `while`):

```ruby
2 == 2
'kissa' == "kissa"
'koira' != 'kissa'
1 < 0
3 == 12 / 4
'false'
false
[false]
''
nil
[]
0
```

On tärkeää ymmärtää, että while-silmukka toistaa koodia välillä `while` .. `end` niin pitkään kun ehto on tosi. Ehto tarkistetaan ensimmäisellä kerralla ja uudestaan joka kerta sen jälkeen, kun silmukan viimeinen rivi on suoritettu, ja _vain silloin_. Silmukan suorittaminen ei lopu esim. silloin, jos ehtolauseen arvo muuttuisi epätodeksi silmukan suorittamisen aikana. Huomaa myös, että simukka on niinsanottu ikuinen silmukka, jos ehto ei ole koskaan epätosi. Esimerkiksi seuraava ohjelma ei koskaan lopeta suoritusta:

```ruby
while true
  puts "tämä toistuu loputtomiin"
  sleep 0.2
end
```
{tip-begin}
Sen päätteleminen päättyykö joidenkin silmukoiden suorittaminen koskaan ei ole aina triviaalia. Ohjelmistotieteessä tämä tunnetaan nimellä <a href="https://en.wikipedia.org/wiki/Halting_problem">Halting problem</a>
{tip-end}

Ainoa tapa lopettaa ohjelma tällaisessa tilanteessa on lopettaa se pakkokeinoin. Onneksi se onnistuu tässä tapauksessa vain sanomalla terminaalissa `ctrl+c`. Voit kokeilla tätäkin jos haluat.

Tässä vaiheessa on hyvä vetää syvään henkeä, koska olemme saavuttaneet merkittävän etapin: tiedät nyt kaikki tarpeelliset käsitteet, mitä tarvitaan  _mielivaltaisen tietokone-ohjelman toteuttamiseen_. Luit oikein, minkä hyvänsä! Siistiä, eikö?

Isompien ohjelmien tekeminen vain näillä tiedoilla olisi melkoisen vaikeaa, mutta kuitenkin varsin mahdollista!

Voimme laskea juttuja, liittää yhteen merkkijonoja, sijoittaa arvoja muuttujiin. Voimme tehdä päätöksiä riippuen juttujen arvoista, ja voimme toistaa juttuja.

Nämä ovat _kaikkien_ tietokone-ohjelmien rakennusaineita. Kaikki muu on vain yksityiskohtia, ja em. ajatusten soveltamista.

{tip-begin}
<p>Toisinaan ihmiset puhuvat "ohjelmoinnista" ja "koodaamisesta" sekaisin. Kuitenkaan esimerkiksi HTML:n kirjoittaminen ei ole ohjelmointia, vaikka sitä voidaan kutsua koodaamiseksi. Koodaaminen on väljästi vain asioiden esittämistä jossain toisessa muodossa, mikä voi olla ohjelmointia (Ruby) tai asian esittämistä jossain toisessa muodossa (HTML). Kuitenkaan koska esim. HTML:ssä ei ole ehtolauseita eikä toistoa, se ei voi olla ohjelmointikieli, eikä siten HTML:n kirjoittaminen ole ohjelmointia, vaikka se onkin koodausta. Kaikki ohjelmointi on siten koodausta, mutta kaikki koodaus ei ole ohjelmointia. Huh!
</p>

<p>
On myös varsin epämielekästä sanoa, että HTML:ssä olisi mitään "toimintoja" tai että se "suorittaisi" mitään, vaikka tietystä näkökulmasta voitaneen ajatella esim. _title_ -elementin olevan "funktio", joka näyttää dokumentin otsikon. Tavallaan. Mutta sinun pitäisi vähintäänkin irvistää hieman, jos joku sanoo niin. Mainittu virhekäsitys lienee yleinen siksi, että HTML:n sekaan voidaan upottaa kyllä ohjelmointikieltä (esim.  JavaScript), mutta JavaScript ei silti ole osa HTML:ää. Se on ohjelmointikieli.
</p>
{tip-end}

### Yhteenveto

Opimme nyt viimeisimpänä toiston. Meillä on kahdenlaisia toistorakenteita/silmukoita:

1. `each` toimii kaikkien kokoelmien (kuten taulukko) kanssa, eikä sen kanssa tarvitse tietää kuinka monta alkiota kokoelmassa on
2. `while` toistaa silmukkaa niin pitkään, kun sen yhteydessä annettu ehtolause on tosi

`while` on sikäli ilmaisuvoimaisin, että sen avulla voidaan toteuttaa mikä hyvänsä silmukka, mutta `each` on usein kätevämpi ja tiiviimpi, kun pitää käsitellä kokoelman kaikki alkiot jotenkin.

Voisit hakea tässä vaiheessa kupin lämmintä lempijuomaasi, olet sen ansainnut! Miettien hieman samalla juuri oppimiasi asioita. Ole hyvä ja rapsuta samalla lemmikkikoiraasi tai kissaasi, jos sinulla sellainen on. Hevosen taputtaminen on ok sekin :3

[^fn-array] Jep, sisäkkäisyydellä ei ole rajaa, eli taulukko voi sisältää toisia taulukoita: `[1, [2, 3], [4, [[5], [6]]]]` ja toisinaan vielä mutkikkaammatkin taulukot ovat tarpeen.

### Harjoituksia

#### Vinkkejä

Allaolevissa harjoituksissa on tarpeen tietää seuraavaa:

* Toistaaksesi jotain tarkalleen n kertaa, voit sanoa `n.times { |i| # koodi, jota toistetaan n kertaa }`. `i` tässä lohkossa on laskuri, joka saa järjestyksessä vuorollaan kaikki arvot väliltä 0 .. n-1. Silmukka siis toistuu n kertaa (muista, että ohjelmoidessa laskenta alkaa yleensä aina luvusta 0).
* `puts` tulostaa automaattisesti rivinvaihdon merkkijonon perään, kun taas `print` ei. `puts` ilman parametria tulostaa pelkän rivinvaihdon, mikä on toisinaan kätevää.
* `||` tarkoittaa loogista "tai"-operaatiota. Siten lauseke `if 2 > 3 || 2 > 1` on tosi, koska ainakin operaattorin toinen puoli (2 > 1) on tosi
* `&&` on looginen "ja". Lauseke `foo && bar`on tosi vain silloin, kun operaattorin molemmat puolet (`foo` että `bar`) ovat tosia.

**Tärkeää**: yleisesti helpoin tapa ratkaista ongelma on tehdä ensiksi ratkaisu, joka vie ratkaisua edes jotenkin oikeaan suuntaan, vaikka ei olisikaan heti toimiva versio. Itse asiassa kukaan tietämäni ammattilainen ei kirjoita mitään ohjelmaa heti toimivaksi, vaan pienissä osissa sinne päin, tarkentaen ja korjaten ongelmia vähitellen. Tässä tapa miten luultavasti ratkaisisin ensimmäisen tehtävän, jos kieli olisi minulle täysin uusi:

1. Tulosta vain yksi '.' -merkki -- kyllä, luit ihan oikein :) Silloin osaan tulostaa tekstiä, ja varmasti suorittaa ohjelman
1. Tulosta yksi rivi '.' -merkkejä, siten että kerron rivin pituuden numeerisesti sen sijaan, että kopioisin merkkien määrän
1. Tulosta yksi rivi '.' -merkkejä, siten että tulostettavan rivin pituus on muuttujassa.
1. Kääri edellinen ratkaisu toistorakenteeseen, joka toistaa em. koodin halutun määrän kertoja (tässä 5 kertaa). Sitten ohjelma onkin valmis!

#### Harjoitustehtävät

Kirjoita ohjelma, joka
{tip-begin}
Rubyssä on monta tapaa toistaa asioita. `Integer#times` on näistä vain yksi (merkintä tarkoittaa, että mille vain kokonaisluvulle on olemassa metodi `times` kuten `42.times`). Samoin huomaa, että jos koodisi merkkien `{ .. }` välissä koostuu useammasta kuin yhdestä rivistä, aaltosulkeet `{ .. }` on tapana korvata merkinnällä `do .. end`. Ne toimivat täsmälleen samoin koodilohkoissa, mutta `do .. end` on idiomaattinen tapa kirjoittaa lohko, jos se koostuu useasta rivistä.
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
Komentoriviparametrit voit lukea aina muuttujasta `ARGV`. Ruby tarjoaa sen kaikille ohjelmille, vaikka et sitä käyttäisi. Jos parametreja ei ole (kuten 1. tehtävässä), taulukko on yksinkertaisesti tyhjä (huomaa ero tyhjän taulukon ja `nil`in välillä!)

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
