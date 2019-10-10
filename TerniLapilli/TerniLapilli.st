!classDefinition: #TerniLapilliTest category: #TerniLapilli!
TestCase subclass: #TerniLapilliTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'Luca 10/10/2019 18:16:23'!
test01GameStartsWithAnEmptyBoard

	|game|
	
	game _ TerniLapilli new.
	
	self assert: game isEmpty.! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'Luca 10/10/2019 18:26:19'!
test02XPlaysFirstAndOCantPlayFirst

	|game|
	
	game _ TerniLapilli new.
	
	self assert: game isPlayingX.
	
	self deny: game isPlayingO.! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'Luca 10/10/2019 18:50:25'!
test03AfterXPlaysItsOTurn

	|game|
	
	game _ TerniLapilli new.
	
	game putXAt: 1@1.
	
	self assert: (game isXat: 1@1).
	
	self assert: game isPlayingO 
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'Luca 10/10/2019 18:52:54'!
test04AfterOPlaysItsXTurn

	|game|
	
	game _ TerniLapilli new.
	
	game putXAt: 1@1.
	
	game putOAt: 1@3.
	
	self assert: game isPlayingX.
	
	self assert: (game isOat: 1@3). 
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'Luca 10/10/2019 20:09:49'!
test05IfXIsInAPositionThenOCannotPutItsPieceThere

	|game|
	
	game _ TerniLapilli new.
	
	game putXAt: 1@1.

	self 
		should: [game putOAt: 1@1]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | self assert: anError messageText equals: TerniLapilli positionOccupiedErrorMessage .
							self assert: (game isXat: 1@1).
							self deny: (game isOat: 1@1).
							].
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'Luca 10/10/2019 20:13:57'!
test06IfXIsInAnOutOfRangePositionThenItShouldFail

	|game|
	
	game _ TerniLapilli new.
	
	self 
		should: [game putOAt: 1@-1]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | self assert: anError messageText equals: TerniLapilli  pointOutOfRangeErrorMessage.
							].
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'Luca 10/10/2019 20:33:18'!
test07IfXMovesThenItShouldBeInTheNewPosition

	|game|
	
	game _ TerniLapilli new.
	
	game putXAt: 1@1.
	game putOAt: 1@2.
	game putXAt: 1@3.
	game putOAt: 2@1.
	game putXAt: 2@2.
		
	self 
	should: [game moveOAt: 2@1 to: 3@1.]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [ :anError | self assert: anError messageText equals: TerniLapilli cannotMoveBeforeFirstSixTurnsErrorMessage.
						self assert: (game isOat: 2@1).
						self deny: (game isOat: 3@1).
						].	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'Luca 10/10/2019 20:29:46'!
test08IfXMovesThenItShouldBeInTheNewPosition

	|game|
	
	game _ TerniLapilli new.
	
	game putXAt: 1@1.
	game putOAt: 1@2.
	game putXAt: 1@3.
	game putOAt: 2@1.
	game putXAt: 2@2.
	game putOAt: 2@3.
	
	game moveXAt: 2@2 to: 3@2.
	
	self assert: (game isXat: 3@2).
	
	! !


!classDefinition: #TerniLapilli category: #TerniLapilli!
Object subclass: #TerniLapilli
	instanceVariableNames: 'board juegaX'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Luca 10/10/2019 20:05:25'!
checkThatActionCanBeExecutedWith: aPoint.
	
	((self isXat: aPoint) or: (self isOat: aPoint)) ifTrue: [^self error: self class positionOccupiedErrorMessage].
	(self checkThatPointIsInRange: aPoint) ifFalse: [^self error: self class pointOutOfRangeErrorMessage]. ! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Luca 10/10/2019 20:00:37'!
checkThatPointIsInRange: aPoint
	^aPoint x >= 1 and: aPoint x <= 3 and: aPoint y >= 1 and: aPoint y <= 3.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Luca 10/10/2019 19:50:12'!
initialize

	juegaX _ true.
	board _  Dictionary new.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Luca 10/10/2019 20:06:15'!
isEmpty

	^board isEmpty.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Luca 10/10/2019 20:08:18'!
isOat: aPoint 
	^(board at: aPoint ifAbsent: [^false]) = #O.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Luca 10/10/2019 18:32:14'!
isPlayingO
	^ juegaX not.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Luca 10/10/2019 18:30:38'!
isPlayingX
	^juegaX! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Luca 10/10/2019 20:09:06'!
isXat: aPoint 
	^(board at: aPoint ifAbsent: [^false]) = #X.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Luca 10/10/2019 20:34:10'!
moveOAt: currentPosition to: aNewPosition

	"chequear ambas posiciones"
	"chequear no mover antes de las 6"
	
	board removeKey: currentPosition.
	board at: aNewPosition put: #O.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Luca 10/10/2019 20:25:43'!
moveXAt: currentPosition to: aNewPosition

	"chequear ambas posiciones"
	
	
	board removeKey: currentPosition.
	board at: aNewPosition put: #X.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Luca 10/10/2019 20:05:49'!
putOAt: aPoint 

	self checkThatActionCanBeExecutedWith: aPoint.
	
	juegaX _ juegaX not.
	
	board at: aPoint put: #O.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Luca 10/10/2019 20:05:11'!
putXAt: aPoint 
	
	self checkThatActionCanBeExecutedWith: aPoint.
	
	juegaX _ juegaX not.	
		
	board at: aPoint put: #X.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilli class' category: #TerniLapilli!
TerniLapilli class
	instanceVariableNames: ''!

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'Luca 10/10/2019 20:33:48'!
cannotMoveBeforeFirstSixTurnsErrorMessage
	^'pieces cannot be moved before the first six moves'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'Luca 10/10/2019 18:33:09'!
initialize

	^self initialize! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'Luca 10/10/2019 20:02:17'!
pointOutOfRangeErrorMessage
	^'point is out of range'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'Luca 10/10/2019 19:47:22'!
positionOccupiedErrorMessage
	^'posicion ocupada'! !

TerniLapilli initialize!