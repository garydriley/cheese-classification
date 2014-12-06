;user input
(defrule user-input
	(initial-fact) ;fires if initial fact is in the system
=>
	(printout t "Enter the milk source" crlf)
	(assert (milk-source (read)))

	(printout t "Enter the type of cheese" crlf)
	(assert (type (read)))

	(printout t "Enter the texture of the cheese" crlf)
	(bind ?string (readline)) ;reading more than one word
	(assert-string (str-cat "(" ?string ")"))

	(printout t "Enter the colour of the cheese" crlf)
	(assert (colour (read)))

	(printout t "Enter the flavour of the cheese" crlf)
	(bind ?string (readline))
	(assert-string (str-cat "(" ?string ")"))

	(printout t "Enter the aroma of the cheese" crlf)
	(assert (aroma (read)))
)


;rules section

(defrule gouda
	(milk-source cow | goat | sheep) ;cow or goat or sheep
	(type semi-hard)
	(texture campact crumbly dense springy)
	(colour yellow)
	(flavour creamy full-flavoured nutty sweet)
	(aroma pungent)
=>
	(assert (cheese-is gouda))
	(printout t "Gouda asserted" crlf) ;this is just a print out to console
)

(deftemplate cheese 
	(multislot type
		(type SYMBOL)
		(allowed-symbols semi-soft soft semi-hard hard blue)
		(default ?NONE)
	)
	(multislot texture
		(type SYMBOL)
		(allowed-symbols creumbly springy firm creamy smooth)
		(default ?NONE)
	)
	(multislot flavour
		(type SYMBOL)
		(allowed-symbols strong mild rich sweet spicy creamy)
		(default ?NONE)
	)
	(multislot aroma
		(type SYMBOL)
		(allowed-symbols strong mild pleasant pungent none)
		(default ?NONE)
	)
	(multislot colour
		(type SYMBOL)
		(allowed-symbols white yellow pale-yellow)
		(default ?NONE)
	)
	(multislot milk-source
		(type SYMBOL)
		(allowed-symbols cow goat sheep buffalo)
		(default ?NONE)
	)
)

flavour:
strong/sharp, mild, rich/full-flavoured
sweet spicy creamy

texture:
crumbly springy firm/compact
creamy smooth
grainy?

aroma:
strong, mild
pleasant pungent
none/fresh

colour:
white yellow pale-yellow  

type:
semi-soft, soft, semi-hard, hard, blue

meal-compatability:
table-cheese cooking melting/dreassing/dip
sandwhich/bread salad/fruit pasta pizza cheesecake

-----------------------------------------------------
milk-source:
cow, goat, sheep, buffalo

