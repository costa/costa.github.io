class Time
  _(@::).extend Backbone.Events

  constructor: ->
    @_delay()

  _delay: ->
    @_to = _(=>
      @_emit()
    ).delay 40

  _emit: ->
    @trigger 'tick', new Date().getTime()
    @_delay()


class FontRepository

  constructor: (time)->
    @fonts =
      style: ['normal', 'italic', 'oblique']
      weight: [100, 200, 300, 400, 500, 600, 700, 800, 900]
      size: ['44.4%', '66.6%', '100%', '150%', '225%']
      family: ['sans-serif', 'serif', 'monospace', 'cursive', 'fantasy']

  random: (quality)->
    _(@fonts[quality]).sample()

  randomCss: ->
    prop = _(_(@fonts).keys()).sample()
    _({}).tap (css)=>
      css["font-#{prop}"] = "#{@random prop}"


class GoogleFontRepository extends FontRepository

  google_ofl = [
    "Abel",
    "Abril Fatface",
    "Acme",
    "Actor",
    "Adamina",
    "Advent Pro",
    "Aguafina Script",
    "Aladin",
    "Aldrich",
    "Alegreya",
    "Alegreya Sans",
    "Alegreya SC",
    "Alex Brush",
    "Alfa Slab One",
    "Alice",
    "Alike",
    "Alike Angular",
    "Allan",
    "Allerta",
    "Allerta Stencil",
    "Allura",
    "Almendra",
    "Almendra SC",
    "Amaranth",
    "Amatic SC",
    "Amethysta",
    "Andada",
    "Andika",
    "Angkor",
    "Annie Use Your Telescope",
    "Anonymous Pro",
    "Antic",
    "Antic Didone",
    "Antic Slab",
    "Anton",
    "Arapey",
    "Arbutus",
    "Architects Daughter",
    "Arizonia",
    "Armata",
    "Artifika",
    "Arvo",
    "Asap",
    "Asset",
    "Astloch",
    "Asul",
    "Atomic Age",
    "Aubrey",
    "Audiowide",
    "Average",
    "Averia Gruesa Libre",
    "Averia Libre",
    "Averia Sans Libre",
    "Averia Serif Libre",
    "Bad Script",
    "Balthazar",
    "Bangers",
    "Basic",
    "Battambang",
    "Baumans",
    "Bayon",
    "Belgrano",
    "Belleza",
    "Bentham",
    "Berkshire Swash",
    "Bevan",
    "Bigshot One",
    "Bilbo",
    "Bilbo Swash Caps",
    "Bitter",
    "Black Ops One",
    "Bokor",
    "Bonbon",
    "Boogaloo",
    "Bowlby One",
    "Bowlby One SC",
    "Brawler",
    "Bree Serif",
    "Bubblegum Sans",
    "Buenard",
    "Butcherman",
    "Butterfly Kids",
    "Cabin",
    "Cabin Condensed",
    "Cabin Sketch",
    "Caesar Dressing",
    "Cagliostro",
    "Cambo",
    "Candal",
    "Cantarell",
    "Cantata One",
    "Cardo",
    "Carme",
    "Carter One",
    "Caudex",
    "Cedarville Cursive",
    "Ceviche One",
    "Changa One",
    "Chango",
    "Chau Philomene One",
    "Chelsea Market",
    "Chenla",
    "Chicle",
    "Chivo",
    "Coda",
    "Codystar",
    "Comfortaa",
    "Concert One",
    "Condiment",
    "Content",
    "Contrail One",
    "Convergence",
    "Cookie",
    "Copse",
    "Corben",
    "Coustard",
    "Covered By Your Grace",
    "Creepster",
    "Crete Round",
    "Crimson Text",
    "Cuprum",
    "Cutive",
    "Damion",
    "Dancing Script",
    "Dangrek",
    "Dawning of a New Day",
    "Days One",
    "Delius",
    "Delius Swash Caps",
    "Delius Unicase",
    "Della Respira",
    "Devonshire",
    "Didact Gothic",
    "Diplomata",
    "Diplomata SC",
    "Doppio One",
    "Dorsa",
    "Dosis",
    "Dr Sugiyama",
    "Duru Sans",
    "Dynalight",
    "Eater",
    "EB Garamond",
    "Economica",
    "Electrolize",
    "Emblema One",
    "Emilys Candy",
    "Engagement",
    "Enriqueta",
    "Erica One",
    "Esteban",
    "Euphoria Script",
    "Ewert",
    "Exo",
    "Expletus Sans",
    "Fanwood Text",
    "Fascinate",
    "Fascinate Inline",
    "Federant",
    "Federo",
    "Felipa",
    "Fjord One",
    "Flamenco",
    "Flavors",
    "Fondamento",
    "Forum",
    "Francois One",
    "Fredericka the Great",
    "Fredoka One",
    "Freehand",
    "Fresca",
    "Frijole",
    "Fugaz One",
    "Gabriela",
    "Galdeano",
    "Gentium Basic",
    "Gentium Book Basic",
    "Geo",
    "Geostar",
    "Geostar Fill",
    "Germania One",
    "GFS Didot",
    "GFS Neohellenic",
    "Give You Glory",
    "Glass Antiqua",
    "Glegoo",
    "Gloria Hallelujah",
    "Goblin One",
    "Gochi Hand",
    "Gorditas",
    "Goudy Bookletter 1911",
    "Graduate",
    "Gravitas One",
    "Great Vibes",
    "Gruppo",
    "Gudea",
    "Habibi",
    "Hammersmith One",
    "Handlee",
    "Hanuman",
    "Happy Monkey",
    "Henny Penny",
    "Herr Von Muellerhoff",
    "Hind",
    "Holtwood One SC",
    "Homenaje",
    "Iceberg",
    "Iceland",
    "IM Fell Double Pica",
    "IM Fell Double Pica SC",
    "IM Fell DW Pica",
    "IM Fell DW Pica SC",
    "IM Fell English",
    "IM Fell English SC",
    "IM Fell French Canon",
    "IM Fell French Canon SC",
    "IM Fell Great Primer",
    "IM Fell Great Primer SC",
    "Imprima",
    "Inconsolata",
    "Inder",
    "Indie Flower",
    "Inika",
    "Italiana",
    "Italianno",
    "Jim Nightshade",
    "Jockey One",
    "Jolly Lodger",
    "Josefin Sans",
    "Josefin Slab",
    "Judson",
    "Julee",
    "Junge",
    "Jura",
    "Just Me Again Down Here",
    "Kalam",
    "Kameron",
    "Karla",
    "Karma",
    "Kaushan Script",
    "Kavoon",
    "Kelly Slab",
    "Kenia",
    "Khand",
    "Khmer",
    "Knewave",
    "Kotta One",
    "Koulen",
    "Kreon",
    "Kristi",
    "Krona One",
    "La Belle Aurore",
    "Lancelot",
    "Lato",
    "League Script",
    "Leckerli One",
    "Ledger",
    "Lekton",
    "Lemon",
    "Life Savers",
    "Lilita One",
    "Limelight",
    "Linden Hill",
    "Lobster",
    "Lobster Two",
    "Londrina Outline",
    "Londrina Shadow",
    "Londrina Sketch",
    "Londrina Solid",
    "Lora",
    "Loved by the King",
    "Lovers Quarrel",
    "Love Ya Like A Sister",
    "Lusitana",
    "Lustria",
    "Macondo",
    "Macondo Swash Caps",
    "Magra",
    "Mako",
    "Marck Script",
    "Marko One",
    "Marmelad",
    "Marvel",
    "Mate",
    "Mate SC",
    "Maven Pro",
    "Meddon",
    "MedievalSharp",
    "Medula One",
    "Megrim",
    "Merienda One",
    "Merriweather",
    "Merriweather Sans",
    "Metal",
    "Metal Mania",
    "Metamorphous",
    "Metrophobic",
    "Michroma",
    "Miltonian",
    "Miltonian Tattoo",
    "Miniver",
    "Miss Fajardose",
    "Modern Antiqua",
    "Molengo",
    "Monofett",
    "Monoton",
    "Monsieur La Doulaise",
    "Montaga",
    "Montserrat",
    "Moul",
    "Moulpali",
    "Mr Bedfort",
    "Mr Dafoe",
    "Mr De Haviland",
    "Mrs Saint Delafield",
    "Mrs Sheppards",
    "Muli",
    "Mystery Quest",
    "Neucha",
    "Neuton",
    "News Cycle",
    "Niconne",
    "Nixie One",
    "Nobile",
    "Norican",
    "Nosifer",
    "Nothing You Could Do",
    "Noticia Text",
    "Nova Cut",
    "Nova Flat",
    "Nova Mono",
    "Nova Oval",
    "Nova Round",
    "Nova Script",
    "Nova Slim",
    "Nova Square",
    "Numans",
    "Nunito",
    "Odor Mean Chey",
    "Oldenburg",
    "Old Standard TT",
    "Oleo Script",
    "Orbitron",
    "Original Surfer",
    "Oswald",
    "Overlock",
    "Overlock SC",
    "Over the Rainbow",
    "Ovo",
    "Pacifico",
    "Parisienne",
    "Passero One",
    "Passion One",
    "Patrick Hand",
    "Patua One",
    "Paytone One",
    "Petrona",
    "Philosopher",
    "Piedra",
    "Pinyon Script",
    "Plaster",
    "Play",
    "Playball",
    "Playfair Display",
    "Podkova",
    "Poiret One",
    "Poller One",
    "Poly",
    "Pompiere",
    "Pontano Sans",
    "Port Lligat Sans",
    "Port Lligat Slab",
    "Prata",
    "Preahvihear",
    "Press Start 2P",
    "Princess Sofia",
    "Prociono",
    "Prosto One",
    "PT Mono",
    "PT Sans",
    "PT Sans Caption",
    "PT Sans Narrow",
    "PT Serif",
    "PT Serif Caption",
    "Puritan",
    "Quantico",
    "Quattrocento",
    "Quattrocento Sans",
    "Questrial",
    "Quicksand",
    "Qwigley",
    "Radley",
    "Rajdhani",
    "Raleway",
    "Rammetto One",
    "Rationale",
    "Reenie Beanie",
    "Revalia",
    "Ribeye",
    "Ribeye Marrow",
    "Righteous",
    "Rokkitt",
    "Ropa Sans",
    "Rosario",
    "Rosarivo",
    "Rouge Script",
    "Ruda",
    "Ruge Boogie",
    "Ruluko",
    "Ruslan Display",
    "Russo One",
    "Ruthie",
    "Sail",
    "Salsa",
    "Sancreek",
    "Sansita One",
    "Sarina",
    "Seaweed Script",
    "Sevillana",
    "Shadows Into Light",
    "Shadows Into Light Two",
    "Shanti",
    "Share",
    "Shojumaru",
    "Short Stack",
    "Siemreap",
    "Sigmar One",
    "Signika",
    "Signika Negative",
    "Simonetta",
    "Sirin Stencil",
    "Six Caps",
    "Smythe",
    "Sniglet",
    "Snippet",
    "Sofia",
    "Sonsie One",
    "Sorts Mill Goudy",
    "Source Code Pro",
    "Source Sans Pro",
    "Spicy Rice",
    "Spinnaker",
    "Spirax",
    "Squada One",
    "Stardos Stencil",
    "Stint Ultra Condensed",
    "Stint Ultra Expanded",
    "Stoke",
    "Sue Ellen Francisco",
    "Supermercado One",
    "Suwannaphum",
    "Swanky and Moo Moo",
    "Tangerine",
    "Taprom",
    "Teko",
    "Telex",
    "Tenor Sans",
    "The Girl Next Door",
    "Tienne",
    "Titan One",
    "Trade Winds",
    "Trocchi",
    "Trochut",
    "Trykker",
    "Tulpen One",
    "Uncial Antiqua",
    "UnifrakturMaguntia",
    "Unlock",
    "Unna",
    "Varela",
    "Varela Round",
    "Vast Shadow",
    "Vesper Libre",
    "Vibur",
    "Vidaloka",
    "Viga",
    "Voces",
    "Volkhov",
    "Vollkorn",
    "Voltaire",
    "VT323",
    "Waiting for the Sunrise",
    "Wallpoet",
    "Wellfleet",
    "Wire One",
    "Yanone Kaffeesatz",
    "Yeseva One",
    "Yesteryear",
    "Zeyada"
  ]

  constructor: (time, random_number)->
    super

    loadRandomFont = =>
      return  unless _.random(1, @fonts.family.length * 4) == 1

      random_font = _(google_ofl).sample()
      @_loadFont random_font  unless _(@fonts.family).contains(random_font)

      time.off 'tick', loadRandomFont  unless @fonts.family.length < random_number
    time.on 'tick', loadRandomFont

  _loadFont: (font)->
    $("<link href='//fonts.googleapis.com/css?#{$.param family: font}' rel='stylesheet'>").
      appendTo('head').
      on 'load', =>
        @fonts.family.push font


class TypeFx

  constructor: (time, font_repo)->

    randomFxNow = =>
      Math.random()*(@probability || Infinity) < 1

    time.on 'tick', =>
      $('.type-fx:visible').each ->
        $(@).css font_repo.randomCss()  if randomFxNow()


class Throttler

  constructor: (time, obj, prop, plan)->
    @curr_time = (new Date().getTime()) + plan[0][0] * 1000
    @curr_bull = 0

    setNext = (timestamp)=>
      while timestamp > @curr_time
        obj[prop] = plan[@curr_bull][1]
        if @curr_bull < plan.length - 1
          @curr_time += plan[++@curr_bull][0] * 1000
        else
          time.off 'tick', setNext
          break
    time.on 'tick', setNext


time = new Time
font_repo = new GoogleFontRepository time, 66
type_fx = new TypeFx time, font_repo
throttle_fx = new Throttler time, type_fx, 'probability',
  [[0,360],[32,1000]]
_(-> $('.slide-down-later').slideDown()).delay 10000

slideTabs = ->
  $('.tabs-slider > h3.active').each ->
    i = $(@).index()
    $('.slider', $(@).parent()).queue ->
      $(@).animate(
        scrollLeft: i * $(@).width()
      ).dequeue()
$('.tabs-slider').on 'click', '> h3:not(.active)', ->
  $el =
  $('h3.active', $(@).parent()).removeClass 'active'
  $(@).addClass 'active'
  slideTabs()
$(window).on 'resize', _(slideTabs).throttle 150
