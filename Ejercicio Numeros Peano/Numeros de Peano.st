!classDefinition: #I category: #'Numeros de Peano'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #'Numeros de Peano'!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'as yet unclassified' stamp: 'Luca 9/1/2019 20:10:12'!
* unNumeroDePeano

	^unNumeroDePeano! !

!I class methodsFor: 'as yet unclassified' stamp: 'Luca 9/1/2019 16:57:49'!
+ unNumeroDePeano

	^unNumeroDePeano next! !

!I class methodsFor: 'as yet unclassified' stamp: 'Luca 9/1/2019 21:53:50'!
- unNumeroDePeano

	^self error: self descripcionDeErrorDeNumerosNegativosNoSoportados ! !

!I class methodsFor: 'as yet unclassified' stamp: 'Luca 9/1/2019 21:52:23'!
/ unNumeroDePeano

	unNumeroDePeano  = I
	ifTrue: [^ self.]
	ifFalse:[self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor.]! !

!I class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 00:55:56'!
> unNumeroDePeano

	^false! !

!I class methodsFor: 'as yet unclassified' stamp: 'Luca 9/1/2019 21:51:26'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^'No se puede dividir por un numero mayor'! !

!I class methodsFor: 'as yet unclassified' stamp: 'Luca 9/1/2019 21:53:25'!
descripcionDeErrorDeNumerosNegativosNoSoportados

	^'Numeros negativos no soportados'! !

!I class methodsFor: 'as yet unclassified' stamp: 'Luca 8/26/2019 18:26:04'!
next

	^II! !

!I class methodsFor: 'as yet unclassified' stamp: 'Luca 9/1/2019 21:37:50'!
sustraerDe: unNumeroDePeano

	^unNumeroDePeano previous! !


!classDefinition: #II category: #'Numeros de Peano'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: #'Numeros de Peano'!
II class
	instanceVariableNames: 'next previous'!

!II class methodsFor: 'as yet unclassified' stamp: 'Luca 9/1/2019 20:16:21'!
* unNumeroDePeano

	^ self + (unNumeroDePeano  previous * self)! !

!II class methodsFor: 'as yet unclassified' stamp: 'Luca 8/26/2019 20:46:41'!
+ unNumeroDePeano

	^ self previous  + unNumeroDePeano next ! !

!II class methodsFor: 'as yet unclassified' stamp: 'Luca 9/1/2019 21:34:16'!
- unNumeroDePeano

	^ unNumeroDePeano  sustraerDe: self! !

!II class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:18:41'!
/ unNumeroDePeano

	unNumeroDePeano  > self
	ifTrue: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor ].
	
	unNumeroDePeano = self
	ifTrue: [^I.] 
	ifFalse:[ ^ I + ( self - unNumeroDePeano / unNumeroDePeano )].
	
		! !

!II class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 00:51:53'!
> unNumeroDePeano
	
	unNumeroDePeano = I
	ifTrue: [^true.]
	ifFalse: [^ self previous  > unNumeroDePeano  previous .]
! !

!II class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:03:10'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^'No se puede dividir por un numero mayor'! !

!II class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := III.
	previous := I.! !

!II class methodsFor: 'as yet unclassified' stamp: 'Luca 8/26/2019 20:45:34'!
next

	next ifNil:
		[next _ self cloneNamed: self name,'I'.
		next previous: self.
		].
	
	^next! !

!II class methodsFor: 'as yet unclassified' stamp: 'Luca 8/26/2019 18:57:56'!
previous

	^previous! !

!II class methodsFor: 'as yet unclassified' stamp: 'Luca 8/26/2019 20:46:06'!
previous: unNumero

	previous _ unNumero ! !

!II class methodsFor: 'as yet unclassified' stamp: 'Luca 8/26/2019 18:44:06'!
removeAllNext
	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem .
		next _ nil.
	]! !

!II class methodsFor: 'as yet unclassified' stamp: 'Luca 9/1/2019 21:33:49'!
sustraerDe: unNumeroDePeano

	^ unNumeroDePeano  previous  - self previous! !


!classDefinition: #III category: #'Numeros de Peano'!
DenotativeObject subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: #'Numeros de Peano'!
III class
	instanceVariableNames: 'next previous'!

!III class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:25:36'!
* unNumeroDePeano

	^ self + (unNumeroDePeano  previous * self)! !

!III class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:25:36'!
+ unNumeroDePeano

	^ self previous  + unNumeroDePeano next ! !

!III class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:25:36'!
- unNumeroDePeano

	^ unNumeroDePeano  sustraerDe: self! !

!III class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:25:36'!
/ unNumeroDePeano

	unNumeroDePeano  > self
	ifTrue: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor ].
	
	unNumeroDePeano = self
	ifTrue: [^I.] 
	ifFalse:[ ^ I + ( self - unNumeroDePeano / unNumeroDePeano )].
	
		! !

!III class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:25:36'!
> unNumeroDePeano
	
	unNumeroDePeano = I
	ifTrue: [^true.]
	ifFalse: [^ self previous  > unNumeroDePeano  previous .]
! !

!III class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:25:36'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^'No se puede dividir por un numero mayor'! !

!III class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIII.
	previous := II.! !

!III class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:25:36'!
next

	next ifNil:
		[next _ self cloneNamed: self name,'I'.
		next previous: self.
		].
	
	^next! !

!III class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:25:36'!
previous

	^previous! !

!III class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:25:36'!
previous: unNumero

	previous _ unNumero ! !

!III class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:25:36'!
removeAllNext
	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem .
		next _ nil.
	]! !

!III class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:25:36'!
sustraerDe: unNumeroDePeano

	^ unNumeroDePeano  previous  - self previous! !


!classDefinition: #IIII category: #'Numeros de Peano'!
DenotativeObject subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIII class' category: #'Numeros de Peano'!
IIII class
	instanceVariableNames: 'next previous'!

!IIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:25:36'!
* unNumeroDePeano

	^ self + (unNumeroDePeano  previous * self)! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:25:36'!
+ unNumeroDePeano

	^ self previous  + unNumeroDePeano next ! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:25:36'!
- unNumeroDePeano

	^ unNumeroDePeano  sustraerDe: self! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:25:36'!
/ unNumeroDePeano

	unNumeroDePeano  > self
	ifTrue: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor ].
	
	unNumeroDePeano = self
	ifTrue: [^I.] 
	ifFalse:[ ^ I + ( self - unNumeroDePeano / unNumeroDePeano )].
	
		! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:25:36'!
> unNumeroDePeano
	
	unNumeroDePeano = I
	ifTrue: [^true.]
	ifFalse: [^ self previous  > unNumeroDePeano  previous .]
! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:25:36'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^'No se puede dividir por un numero mayor'! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIII.
	previous := III.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:25:36'!
next

	next ifNil:
		[next _ self cloneNamed: self name,'I'.
		next previous: self.
		].
	
	^next! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:25:36'!
previous

	^previous! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:25:36'!
previous: unNumero

	previous _ unNumero ! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:25:36'!
removeAllNext
	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem .
		next _ nil.
	]! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:25:36'!
sustraerDe: unNumeroDePeano

	^ unNumeroDePeano  previous  - self previous! !


!classDefinition: #IIIII category: #'Numeros de Peano'!
DenotativeObject subclass: #IIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIII class' category: #'Numeros de Peano'!
IIIII class
	instanceVariableNames: 'next previous'!

!IIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:35'!
* unNumeroDePeano

	^ self + (unNumeroDePeano  previous * self)! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:35'!
+ unNumeroDePeano

	^ self previous  + unNumeroDePeano next ! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:35'!
- unNumeroDePeano

	^ unNumeroDePeano  sustraerDe: self! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:35'!
/ unNumeroDePeano

	unNumeroDePeano  > self
	ifTrue: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor ].
	
	unNumeroDePeano = self
	ifTrue: [^I.] 
	ifFalse:[ ^ I + ( self - unNumeroDePeano / unNumeroDePeano )].
	
		! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:35'!
> unNumeroDePeano
	
	unNumeroDePeano = I
	ifTrue: [^true.]
	ifFalse: [^ self previous  > unNumeroDePeano  previous .]
! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:35'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^'No se puede dividir por un numero mayor'! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIII.
	previous := IIII.! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:35'!
next

	next ifNil:
		[next _ self cloneNamed: self name,'I'.
		next previous: self.
		].
	
	^next! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:35'!
previous

	^previous! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:35'!
previous: unNumero

	previous _ unNumero ! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:35'!
removeAllNext
	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem .
		next _ nil.
	]! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:35'!
sustraerDe: unNumeroDePeano

	^ unNumeroDePeano  previous  - self previous! !


!classDefinition: #IIIIII category: #'Numeros de Peano'!
DenotativeObject subclass: #IIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIII class' category: #'Numeros de Peano'!
IIIIII class
	instanceVariableNames: 'next previous'!

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:36'!
* unNumeroDePeano

	^ self + (unNumeroDePeano  previous * self)! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:36'!
+ unNumeroDePeano

	^ self previous  + unNumeroDePeano next ! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:36'!
- unNumeroDePeano

	^ unNumeroDePeano  sustraerDe: self! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:36'!
/ unNumeroDePeano

	unNumeroDePeano  > self
	ifTrue: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor ].
	
	unNumeroDePeano = self
	ifTrue: [^I.] 
	ifFalse:[ ^ I + ( self - unNumeroDePeano / unNumeroDePeano )].
	
		! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:36'!
> unNumeroDePeano
	
	unNumeroDePeano = I
	ifTrue: [^true.]
	ifFalse: [^ self previous  > unNumeroDePeano  previous .]
! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:36'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^'No se puede dividir por un numero mayor'! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIII.
	previous := IIIII.! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:36'!
next

	next ifNil:
		[next _ self cloneNamed: self name,'I'.
		next previous: self.
		].
	
	^next! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:36'!
previous

	^previous! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:36'!
previous: unNumero

	previous _ unNumero ! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:36'!
removeAllNext
	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem .
		next _ nil.
	]! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:36'!
sustraerDe: unNumeroDePeano

	^ unNumeroDePeano  previous  - self previous! !


!classDefinition: #IIIIIII category: #'Numeros de Peano'!
DenotativeObject subclass: #IIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIII class' category: #'Numeros de Peano'!
IIIIIII class
	instanceVariableNames: 'next previous'!

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:36'!
* unNumeroDePeano

	^ self + (unNumeroDePeano  previous * self)! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:36'!
+ unNumeroDePeano

	^ self previous  + unNumeroDePeano next ! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:36'!
- unNumeroDePeano

	^ unNumeroDePeano  sustraerDe: self! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:36'!
/ unNumeroDePeano

	unNumeroDePeano  > self
	ifTrue: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor ].
	
	unNumeroDePeano = self
	ifTrue: [^I.] 
	ifFalse:[ ^ I + ( self - unNumeroDePeano / unNumeroDePeano )].
	
		! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:36'!
> unNumeroDePeano
	
	unNumeroDePeano = I
	ifTrue: [^true.]
	ifFalse: [^ self previous  > unNumeroDePeano  previous .]
! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:36'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^'No se puede dividir por un numero mayor'! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIII.
	previous := IIIIII.! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:36'!
next

	next ifNil:
		[next _ self cloneNamed: self name,'I'.
		next previous: self.
		].
	
	^next! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:36'!
previous

	^previous! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:36'!
previous: unNumero

	previous _ unNumero ! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:36'!
removeAllNext
	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem .
		next _ nil.
	]! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:36'!
sustraerDe: unNumeroDePeano

	^ unNumeroDePeano  previous  - self previous! !


!classDefinition: #IIIIIIII category: #'Numeros de Peano'!
DenotativeObject subclass: #IIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIII class' category: #'Numeros de Peano'!
IIIIIIII class
	instanceVariableNames: 'next previous'!

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:36'!
* unNumeroDePeano

	^ self + (unNumeroDePeano  previous * self)! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:36'!
+ unNumeroDePeano

	^ self previous  + unNumeroDePeano next ! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:36'!
- unNumeroDePeano

	^ unNumeroDePeano  sustraerDe: self! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:36'!
/ unNumeroDePeano

	unNumeroDePeano  > self
	ifTrue: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor ].
	
	unNumeroDePeano = self
	ifTrue: [^I.] 
	ifFalse:[ ^ I + ( self - unNumeroDePeano / unNumeroDePeano )].
	
		! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:36'!
> unNumeroDePeano
	
	unNumeroDePeano = I
	ifTrue: [^true.]
	ifFalse: [^ self previous  > unNumeroDePeano  previous .]
! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:36'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^'No se puede dividir por un numero mayor'! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	previous := IIIIIII.! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:36'!
next

	next ifNil:
		[next _ self cloneNamed: self name,'I'.
		next previous: self.
		].
	
	^next! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:36'!
previous

	^previous! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:36'!
previous: unNumero

	previous _ unNumero ! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:36'!
removeAllNext
	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem .
		next _ nil.
	]! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'Luca 9/2/2019 01:28:36'!
sustraerDe: unNumeroDePeano

	^ unNumeroDePeano  previous  - self previous! !

II initializeAfterFileIn!
III initializeAfterFileIn!
IIII initializeAfterFileIn!
IIIII initializeAfterFileIn!
IIIIII initializeAfterFileIn!
IIIIIII initializeAfterFileIn!
IIIIIIII initializeAfterFileIn!