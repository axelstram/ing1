!classDefinition: #TerniLapilliTest category: #TerniLapilli!
TestCase subclass: #TerniLapilliTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'a 10/14/2019 17:02:32'!
putFirstSixPiecesIn: aGame

	aGame putXAt: 1@1.
	aGame putOAt: 1@2.
	aGame putXAt: 1@3.
	aGame putOAt: 2@1.
	aGame putXAt: 2@2.
	aGame putOAt: 2@3.
! !

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

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'a 10/14/2019 16:58:35'!
test07IfSomeoneMovesBeforeTheFirstSixTurnsThenItShouldFail

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

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'a 10/14/2019 17:02:41'!
test08IfXMovesThenItShouldBeInTheNewPosition

	|game|
	
	game _ TerniLapilli new.
	
	self putFirstSixPiecesIn: game.
	
	game moveXAt: 2@2 to: 3@2.
	
	self assert: (game isXat: 3@2).
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'a 10/14/2019 17:53:20'!
test09IfXDoesAnInvalidMoveThenItShouldFail

	|game|
	
	game _ TerniLapilli new.
	
	self putFirstSixPiecesIn: game.
	
	self 
	should: [game moveXAt: 1@1 to: 3@3.]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [ :anError | self assert: anError messageText equals: TerniLapilli invalidMoveErrorMessage.
						].
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'a 10/14/2019 17:59:00'!
test10IfTriesToPutMoreThanSixPiecesThenItShouldFail

	|game|
	
	game _ TerniLapilli new.
	
	self putFirstSixPiecesIn: game.
	
	self 
	should: [game putXAt: 3@1.]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [ :anError | self assert: anError messageText equals: TerniLapilli cannotPutMoreThanSixPiecesErrorMessage.
						].
		
	! !


!classDefinition: #TerniLapilli category: #TerniLapilli!
Object subclass: #TerniLapilli
	instanceVariableNames: 'board juegaX'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'a 10/14/2019 18:01:36'!
changePlayerTurn
	juegaX _ juegaX not.	

! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'a 10/14/2019 17:53:02'!
checkThat: aNewPosition IsNotMoreThanOneDistanceAwayInAnyCoordinateFrom: currentPosition.
	(((currentPosition x - aNewPosition x) abs > 1) or: ((currentPosition y - aNewPosition y) abs > 1)) ifTrue: [^self error: self class invalidMoveErrorMessage ].	! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'a 10/14/2019 17:56:01'!
checkThatActionCanBeExecutedWith: aPosition.
	
	((self isXat: aPosition) or: (self isOat: aPosition)) ifTrue: [^self error: self class positionOccupiedErrorMessage].
	(self checkThatPointIsInRange: aPosition) ifFalse: [^self error: self class pointOutOfRangeErrorMessage].
! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'Luca 10/10/2019 20:00:37'!
checkThatPointIsInRange: aPoint
	^aPoint x >= 1 and: aPoint x <= 3 and: aPoint y >= 1 and: aPoint y <= 3.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'a 10/14/2019 17:00:12'!
checkThatTheFirstSixTurnsHavePassed

	(board size < 6) ifTrue: [^self error: self class cannotMoveBeforeFirstSixTurnsErrorMessage].
! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'a 10/14/2019 17:59:24'!
checkThatThereAreNoMoreThanSixPiecesInTheBoard.
	(board size == 6) ifTrue: [^self error: self class cannotPutMoreThanSixPiecesErrorMessage]. ! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'a 10/14/2019 18:02:16'!
checkTheValidityOfTheMovementFrom: currentPosition to: aNewPosition
	self checkThatActionCanBeExecutedWith: aNewPosition.
	self checkThat: aNewPosition IsNotMoreThanOneDistanceAwayInAnyCoordinateFrom: currentPosition.
	
	"chequear casos que faltan"	! !

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

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'a 10/14/2019 18:05:52'!
moveOAt: currentPosition to: aNewPosition

	"chequear ambas posiciones"
	"chequear si ya hubo ganadores"
	self checkThatTheFirstSixTurnsHavePassed.
	self checkTheValidityOfTheMovementFrom: currentPosition to: aNewPosition.

	board removeKey: currentPosition.
	board at: aNewPosition put: #O.
	
	self changePlayerTurn.
! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'a 10/14/2019 18:06:01'!
moveXAt: currentPosition to: aNewPosition

	"chequear ambas posiciones"
	"chequear si ya hubo ganadores"
	self checkThatTheFirstSixTurnsHavePassed.
	self checkTheValidityOfTheMovementFrom: currentPosition to: aNewPosition.
		
	board removeKey: currentPosition.
	board at: aNewPosition put: #X.
	
	self changePlayerTurn.
! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'a 10/14/2019 18:01:55'!
putOAt: aPoint 
	
	self checkThatThereAreNoMoreThanSixPiecesInTheBoard.
	self checkThatActionCanBeExecutedWith: aPoint.
		
	board at: aPoint put: #O.
	
	self changePlayerTurn.
! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'a 10/14/2019 18:02:00'!
putXAt: aPoint 
	
	self checkThatThereAreNoMoreThanSixPiecesInTheBoard.	
	self checkThatActionCanBeExecutedWith: aPoint.
			
	board at: aPoint put: #X.
	
	self changePlayerTurn.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilli class' category: #TerniLapilli!
TerniLapilli class
	instanceVariableNames: ''!

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'Luca 10/10/2019 20:33:48'!
cannotMoveBeforeFirstSixTurnsErrorMessage
	^'pieces cannot be moved before the first six moves'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'a 10/14/2019 17:55:13'!
cannotPutMoreThanSixPiecesErrorMessage
	^'you cant put more than six pieces in the board'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'Luca 10/10/2019 18:33:09'!
initialize

	^self initialize! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'a 10/14/2019 17:03:48'!
invalidMoveErrorMessage
	^'an invalid move has been attempted'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'Luca 10/10/2019 20:02:17'!
pointOutOfRangeErrorMessage
	^'point is out of range'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'Luca 10/10/2019 19:47:22'!
positionOccupiedErrorMessage
	^'posicion ocupada'! !

TerniLapilli initialize!