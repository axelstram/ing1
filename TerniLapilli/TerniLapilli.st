!classDefinition: #TerniLapilliTest category: #TerniLapilli!
TestCase subclass: #TerniLapilliTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliTest methodsFor: 'TDD' stamp: 'a 10/14/2019 17:02:32'!
putFirstSixPiecesIn: aGame

	aGame putXAt: 1@1.
	aGame putOAt: 1@2.
	aGame putXAt: 1@3.
	aGame putOAt: 2@1.
	aGame putXAt: 2@2.
	aGame putOAt: 2@3.
! !

!TerniLapilliTest methodsFor: 'TDD' stamp: 'Luca 10/10/2019 18:16:23'!
test01GameStartsWithAnEmptyBoard

	|game|
	
	game _ TerniLapilli new.
	
	self assert: game isEmpty.! !

!TerniLapilliTest methodsFor: 'TDD' stamp: 'Luca 10/10/2019 18:26:19'!
test02XPlaysFirstAndOCantPlayFirst

	|game|
	
	game _ TerniLapilli new.
	
	self assert: game isPlayingX.
	
	self deny: game isPlayingO.! !

!TerniLapilliTest methodsFor: 'TDD' stamp: 'Luca 10/10/2019 18:50:25'!
test03AfterXPlaysItsOTurn

	|game|
	
	game _ TerniLapilli new.
	
	game putXAt: 1@1.
	
	self assert: (game isXat: 1@1).
	
	self assert: game isPlayingO 
	
	! !

!TerniLapilliTest methodsFor: 'TDD' stamp: 'Luca 10/10/2019 18:52:54'!
test04AfterOPlaysItsXTurn

	|game|
	
	game _ TerniLapilli new.
	
	game putXAt: 1@1.
	
	game putOAt: 1@3.
	
	self assert: game isPlayingX.
	
	self assert: (game isOat: 1@3). 
	
	! !

!TerniLapilliTest methodsFor: 'TDD' stamp: 'Luca 10/10/2019 20:09:49'!
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

!TerniLapilliTest methodsFor: 'TDD' stamp: 'Luca 10/10/2019 20:13:57'!
test06IfXIsInAnOutOfRangePositionThenItShouldFail

	|game|
	
	game _ TerniLapilli new.
	
	self 
		should: [game putOAt: 1@-1]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | self assert: anError messageText equals: TerniLapilli  pointOutOfRangeErrorMessage.
							].
	
	! !

!TerniLapilliTest methodsFor: 'TDD' stamp: 'Luca 10/16/2019 05:48:00'!
test07IfXTriesToPlayInOTurnItShouldFail

	|game|
	
	game _ TerniLapilli new.
	
	game putXAt: 1@1.
	
	self 
		should: [game putXAt: 1@2]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | self assert: anError messageText equals: TerniLapilli  notYourTurnErrorMessage.
							self deny: (game isXat:1@2). 
							].
	
	! !

!TerniLapilliTest methodsFor: 'TDD' stamp: 'Luca 10/16/2019 05:45:00'!
test08IfSomeoneMovesBeforeTheFirstSixTurnsThenItShouldFail

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

!TerniLapilliTest methodsFor: 'TDD' stamp: 'Luca 10/17/2019 05:08:20'!
test09IfXTriesToPutMoreThanSixPiecesThenItShouldFail

	|game|
	
	game _ TerniLapilli new.
	
	self putFirstSixPiecesIn: game.
	
	self 
	should: [game putXAt: 3@1.]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [ :anError | self assert: anError messageText equals: TerniLapilli cannotPutMoreThanSixPiecesErrorMessage.
						].
		
	! !

!TerniLapilliTest methodsFor: 'TDD' stamp: 'Luca 10/16/2019 05:44:36'!
test10IfXDoesAnInvalidMoveThenItShouldFail

	|game|
	
	game _ TerniLapilli new.
	
	self putFirstSixPiecesIn: game.
	
	self 
	should: [game moveXAt: 1@1 to: 3@3.]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [ :anError | self assert: anError messageText equals: TerniLapilli invalidMoveErrorMessage.
						].
	
	! !

!TerniLapilliTest methodsFor: 'TDD' stamp: 'Luca 10/17/2019 03:21:46'!
test11IfXMovesThenItShouldBeInTheNewPosition

	|game|
	
	game _ TerniLapilli new.
	
	self putFirstSixPiecesIn: game.
	
	game moveXAt: 2@2 to: 3@2.
	
	self assert: (game isXat: 3@2).
	
	self deny: (game isXat: 2@2).
	
	! !

!TerniLapilliTest methodsFor: 'TDD' stamp: 'Luca 10/17/2019 03:21:53'!
test12IfXTriesToMoveFromSomewhereThatDidntHaveATokenItShouldFail

	|game|
	
	game _ TerniLapilli new.
	
	self putFirstSixPiecesIn: game.
	
	self 
	should: [game moveXAt: 3@1 to: 3@2.]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [ :anError | self assert: anError messageText equals: TerniLapilli invalidSourcePosition.
									self deny: (game isXat: 3@1).
									self deny: (game isXat: 3@2).
						].
	
	! !

!TerniLapilliTest methodsFor: 'TDD' stamp: 'Luca 10/17/2019 03:23:14'!
test13IfXTriesToMoveOTokensItShouldFail

	|game|
	
	game _ TerniLapilli new.
	
	self putFirstSixPiecesIn: game.
	
	self 
	should: [game moveXAt: 2@1 to: 3@1.]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [ :anError | self assert: anError messageText equals: TerniLapilli invalidSourcePosition.
									self deny: (game isXat: 2@1).
									self deny: (game isXat: 3@1).
									self assert: (game isOat: 2@1).
						].
	
	! !

!TerniLapilliTest methodsFor: 'TDD' stamp: 'Luca 10/17/2019 04:10:37'!
test14IfXTriesToMoveInOTurnItShouldFail

	|game|
	
	game _ TerniLapilli new.
	
	self putFirstSixPiecesIn: game.
	
	self 
	should: [game moveOAt: 2@1 to: 3@1.]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [ :anError | self assert: anError messageText equals: TerniLapilli notYourTurnErrorMessage .
									self deny: (game isOat: 3@1).
									self assert: (game isOat: 2@1).
						].
	
	! !

!TerniLapilliTest methodsFor: 'TDD' stamp: 'Luca 10/17/2019 04:11:00'!
test15RowWinCondition

	|game|
	
	game _ TerniLapilli new.
	
	game putXAt: 1@1.
	game putOAt: 2@1.
	game putXAt: 1@2.
	game putOAt: 2@2.
	game putXAt: 1@3.
	
	self assert: game isOver.
	
	self assert: game hasPlayerXWon.
	
	self deny: game hasPlayerOWon.
	
	self deny: game isStillGoing.! !

!TerniLapilliTest methodsFor: 'TDD' stamp: 'Luca 10/17/2019 04:46:23'!
test16ColumnWinCondition

	|game|
	
	game _ TerniLapilli new.
	
	game putXAt: 1@1.
	game putOAt: 1@2.
	game putXAt: 2@1.
	game putOAt: 3@2.
	game putXAt: 3@1.
	
	self assert: game isOver.
	
	self assert: game hasPlayerXWon.
	
	self deny: game hasPlayerOWon.
	
	self deny: game isStillGoing.! !

!TerniLapilliTest methodsFor: 'TDD' stamp: 'Luca 10/17/2019 04:46:55'!
test17RightDiagonalWinCondition

	|game|
	
	game _ TerniLapilli new.
	
	game putXAt: 1@1.
	game putOAt: 1@2.
	game putXAt: 2@2.
	game putOAt: 3@2.
	game putXAt: 3@3.
	
	self assert: game isOver.
	
	self assert: game hasPlayerXWon.
	
	self deny: game hasPlayerOWon.
	
	self deny: game isStillGoing.! !

!TerniLapilliTest methodsFor: 'TDD' stamp: 'Luca 10/17/2019 04:48:16'!
test18LeftDiagonalWinCondition

	|game|
	
	game _ TerniLapilli new.
	
	game putXAt: 1@3.
	game putOAt: 1@2.
	game putXAt: 2@2.
	game putOAt: 3@2.
	game putXAt: 3@1.
	
	self assert: game isOver.
	
	self assert: game hasPlayerXWon.
	
	self deny: game hasPlayerOWon.
	
	self deny: game isStillGoing.! !

!TerniLapilliTest methodsFor: 'TDD' stamp: 'Luca 10/17/2019 04:55:58'!
test19WinAfterMoving

	|game|
	
	game _ TerniLapilli new.
	
	game putXAt: 1@1.
	game putOAt: 2@1.
	game putXAt: 1@2.
	game putOAt: 2@2.
	game putXAt: 2@3.
	game putOAt: 3@1.
	
	game moveXAt: 2@3 to: 1@3.
	
	self assert: game isOver.
	
	self assert: game hasPlayerXWon.
	
	self deny: game hasPlayerOWon.
	
	self deny: game isStillGoing.! !

!TerniLapilliTest methodsFor: 'TDD' stamp: 'Luca 10/17/2019 05:02:26'!
test20CantMoveAfterGameEnds

	|game|
	
	game _ TerniLapilli new.
	
	game putXAt: 1@1.
	game putOAt: 2@1.
	game putXAt: 1@2.
	game putOAt: 2@2.
	game putXAt: 1@3.
		
	self 
	should: [game moveOAt: 2@1 to: 3@1.]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [ :anError | self assert: anError messageText equals: TerniLapilli gameEndedErrorMessage.
									self deny: (game isOat: 3@1).
									self assert: (game isOat: 2@1).
						].
	
	! !


!classDefinition: #TerniLapilli category: #TerniLapilli!
Object subclass: #TerniLapilli
	instanceVariableNames: 'board state'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilli methodsFor: 'codigo repetido parametrizado' stamp: 'Luca 10/17/2019 03:11:39'!
isPlayer: aPlayer at: aPoint 
	^(board at: aPoint ifAbsent: [^false]) = aPlayer.! !

!TerniLapilli methodsFor: 'codigo repetido parametrizado' stamp: 'Luca 10/17/2019 05:06:34'!
moveAPlayer: aPlayer At: currentPosition to: aNewPosition

	self checkIfGameContinues.
	self checkPlayer: aPlayer IsAt: currentPosition. 
	self checkThatAPositionIsEmpty: aNewPosition.
	self checkThatTheFirstSixTurnsHavePassed.
	self checkTheValidityOfTheMovementFrom: currentPosition to: aNewPosition.
	self checkValidTurn: aPlayer.
		
	board removeKey: currentPosition.
	board at: aNewPosition put: aPlayer.
	
	self updateGameState .! !

!TerniLapilli methodsFor: 'codigo repetido parametrizado' stamp: 'Luca 10/17/2019 05:06:56'!
putAPlayer: aPlayer At: aPoint 
	
	self checkIfGameContinues.
	self checkThatThereAreNoMoreThanSixPiecesInTheBoard.
	self checkThatAPositionIsEmpty: aPoint.
	self checkValidBoardPosition: aPoint .
	self checkValidTurn: aPlayer.
			
	board at: aPoint put: aPlayer.
	
	self updateGameState .
! !


!TerniLapilli methodsFor: 'error checks' stamp: 'Luca 10/17/2019 05:05:41'!
checkIfGameContinues

	(state isOver ) ifTrue: [^self error: self class gameEndedErrorMessage ]! !

!TerniLapilli methodsFor: 'error checks' stamp: 'Luca 10/17/2019 03:15:48'!
checkPlayer: aPlayer IsAt: currentPosition
	(self isPlayer: aPlayer at: currentPosition) ifFalse: [self error: TerniLapilli invalidSourcePosition ]! !

!TerniLapilli methodsFor: 'error checks' stamp: 'a 10/14/2019 17:53:02'!
checkThat: aNewPosition IsNotMoreThanOneDistanceAwayInAnyCoordinateFrom: currentPosition.
	(((currentPosition x - aNewPosition x) abs > 1) or: ((currentPosition y - aNewPosition y) abs > 1)) ifTrue: [^self error: self class invalidMoveErrorMessage ].	! !

!TerniLapilli methodsFor: 'error checks' stamp: 'Luca 10/16/2019 04:25:48'!
checkThatAPositionIsEmpty: aPosition.
	
	((self isXat: aPosition) or: (self isOat: aPosition)) ifTrue: [^self error: self class positionOccupiedErrorMessage]
! !

!TerniLapilli methodsFor: 'error checks' stamp: 'Luca 10/10/2019 20:00:37'!
checkThatPointIsInRange: aPoint
	^aPoint x >= 1 and: aPoint x <= 3 and: aPoint y >= 1 and: aPoint y <= 3.! !

!TerniLapilli methodsFor: 'error checks' stamp: 'Luca 10/17/2019 04:44:45'!
checkThatTheFirstSixTurnsHavePassed

	(board size < 6) ifTrue: [^self error: self class cannotMoveBeforeFirstSixTurnsErrorMessage].
! !

!TerniLapilli methodsFor: 'error checks' stamp: 'Luca 10/17/2019 02:53:34'!
checkThatThereAreNoMoreThanSixPiecesInTheBoard.
	(board size = 6) ifTrue: [^self error: self class cannotPutMoreThanSixPiecesErrorMessage]. ! !

!TerniLapilli methodsFor: 'error checks' stamp: 'Luca 10/17/2019 03:28:38'!
checkTheValidityOfTheMovementFrom: currentPosition to: aNewPosition

	self checkValidBoardPosition: aNewPosition .
	self checkValidBoardPosition: currentPosition .
	self checkThat: aNewPosition IsNotMoreThanOneDistanceAwayInAnyCoordinateFrom: currentPosition.
	
	
	
	"chequear casos que faltan"! !

!TerniLapilli methodsFor: 'error checks' stamp: 'Luca 10/16/2019 04:21:16'!
checkValidBoardPosition: aPosition.

	(self checkThatPointIsInRange: aPosition) ifFalse: [^self error: self class pointOutOfRangeErrorMessage].
! !

!TerniLapilli methodsFor: 'error checks' stamp: 'Luca 10/17/2019 03:51:13'!
checkValidTurn: aPlayer

	((aPlayer = #X) eqv: state isPlayingX ) ifFalse: [self error: self class notYourTurnErrorMessage ]! !


!TerniLapilli methodsFor: 'state' stamp: 'Luca 10/17/2019 03:50:12'!
changePlayerTurn
	state _ state nextTurn 

! !

!TerniLapilli methodsFor: 'state' stamp: 'Luca 10/17/2019 04:37:46'!
hasPlayerOWon
	^state hasPlayerOWon ! !

!TerniLapilli methodsFor: 'state' stamp: 'Luca 10/17/2019 04:37:41'!
hasPlayerXWon
	^state hasPlayerXWon ! !

!TerniLapilli methodsFor: 'state' stamp: 'Luca 10/10/2019 20:06:15'!
isEmpty

	^board isEmpty.! !

!TerniLapilli methodsFor: 'state' stamp: 'Luca 10/17/2019 03:52:40'!
isOver
	^state isOver! !

!TerniLapilli methodsFor: 'state' stamp: 'Luca 10/17/2019 03:51:55'!
isPlayingO
	^ state isPlayingO .! !

!TerniLapilli methodsFor: 'state' stamp: 'Luca 10/17/2019 03:52:04'!
isPlayingX
	^state isPlayingX ! !

!TerniLapilli methodsFor: 'state' stamp: 'Luca 10/17/2019 04:40:50'!
isStillGoing
	^state isStillGoing ! !

!TerniLapilli methodsFor: 'state' stamp: 'Luca 10/17/2019 05:51:43'!
updateGameState

	(self checkIfAPlayerWon: (state playerPlaying))
			ifTrue: [state _ state playerWon.]
			ifFalse: [self changePlayerTurn]! !


!TerniLapilli methodsFor: 'play' stamp: 'Luca 10/17/2019 03:12:35'!
isOat: aPoint 
	^self isPlayer: #O at: aPoint .! !

!TerniLapilli methodsFor: 'play' stamp: 'Luca 10/17/2019 03:12:12'!
isXat: aPoint 
	^self isPlayer: #X at:aPoint! !

!TerniLapilli methodsFor: 'play' stamp: 'Luca 10/17/2019 03:25:42'!
moveOAt: currentPosition to: aNewPosition

	self moveAPlayer: #O At: currentPosition to: aNewPosition.! !

!TerniLapilli methodsFor: 'play' stamp: 'Luca 10/17/2019 03:26:02'!
moveXAt: currentPosition to: aNewPosition

	self moveAPlayer: #X At: currentPosition to: aNewPosition.
! !

!TerniLapilli methodsFor: 'play' stamp: 'Luca 10/17/2019 03:27:06'!
putOAt: aPoint 
	
	self putAPlayer: #O At: aPoint .! !

!TerniLapilli methodsFor: 'play' stamp: 'Luca 10/17/2019 03:27:13'!
putXAt: aPoint 
	
	self putAPlayer: #X At: aPoint .! !


!TerniLapilli methodsFor: 'initialization' stamp: 'Luca 10/17/2019 03:39:07'!
initialize

	state _ TerniLapilliGameStateXPlays  new.
	board _  Dictionary new.! !


!TerniLapilli methodsFor: 'win conditions' stamp: 'Luca 10/16/2019 05:40:29'!
checkFullColumn: aPlayer 

	|aPlayerPositions|
	
	aPlayerPositions  _ (board select: [:anyPlayer | anyPlayer = aPlayer ]) keys.

	^(aPlayerPositions first y = aPlayerPositions last y) and: (aPlayerPositions first y = (aPlayerPositions at:2) y).

! !

!TerniLapilli methodsFor: 'win conditions' stamp: 'Luca 10/16/2019 05:40:23'!
checkFullRow: aPlayer 

	|aPlayerPositions|
	
	aPlayerPositions  _ (board select: [:anyPlayer | anyPlayer = aPlayer ]) keys.

	^(aPlayerPositions first x = aPlayerPositions last x) and: (aPlayerPositions first x = (aPlayerPositions at:2) x).

! !

!TerniLapilli methodsFor: 'win conditions' stamp: 'Luca 10/17/2019 05:48:25'!
checkIfAPlayerMeetsAWinCondition: aPlayer

	^(self checkFullRow: aPlayer) or:
	(self checkFullColumn: aPlayer) or:
	(self checkRightDiagonal: aPlayer) or:
	(self checkLeftDiagonal: aPlayer)! !

!TerniLapilli methodsFor: 'win conditions' stamp: 'Luca 10/17/2019 05:50:47'!
checkIfAPlayerWon: aPlayer

	(self theresNotEnoughTokensOnTheBoardForAPlayerToWin) ifTrue:[^false].
	
	^self checkIfAPlayerMeetsAWinCondition: aPlayer! !

!TerniLapilli methodsFor: 'win conditions' stamp: 'Luca 10/17/2019 04:52:24'!
checkLeftDiagonal: aPlayer 

	|aPlayerPositions|
	
	aPlayerPositions  _ (board select: [:anyPlayer | anyPlayer = aPlayer ]) keys.

	^(aPlayerPositions includes: (1@3)) and:
	(aPlayerPositions includes: (2@2)) and: 
	(aPlayerPositions includes: (3@1)).! !

!TerniLapilli methodsFor: 'win conditions' stamp: 'Luca 10/17/2019 04:53:35'!
checkRightDiagonal: aPlayer 

	|aPlayerPositions|
	
	aPlayerPositions  _ (board select: [:anyPlayer | anyPlayer = aPlayer ]) keys.

	^(aPlayerPositions includes: (1@1)) and:
	(aPlayerPositions includes: (2@2)) and: 
	(aPlayerPositions includes: (3@3)).

! !

!TerniLapilli methodsFor: 'win conditions' stamp: 'Luca 10/17/2019 05:50:27'!
theresNotEnoughTokensOnTheBoardForAPlayerToWin
	
	^board size < 5! !

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

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'Luca 10/17/2019 05:02:50'!
gameEndedErrorMessage
	^'game has ended'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'Luca 10/16/2019 01:37:53'!
initialize

	^self new initialize! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'a 10/14/2019 17:03:48'!
invalidMoveErrorMessage
	^'an invalid move has been attempted'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'Luca 10/17/2019 03:17:12'!
invalidSourcePosition
	^'player does not have a token in that position'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'Luca 10/17/2019 03:17:52'!
notYourTurnErrorMessage
	^'it is not that players turn'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'Luca 10/10/2019 20:02:17'!
pointOutOfRangeErrorMessage
	^'point is out of range'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'Luca 10/17/2019 03:18:07'!
positionOccupiedErrorMessage
	^'occupied position'! !


!classDefinition: #TerniLapilliGameState category: #TerniLapilli!
Object subclass: #TerniLapilliGameState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!


!classDefinition: #TerniLapilliGameStateOPlays category: #TerniLapilli!
TerniLapilliGameState subclass: #TerniLapilliGameStateOPlays
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliGameStateOPlays methodsFor: 'as yet unclassified' stamp: 'Luca 10/17/2019 03:44:09'!
hasPlayerOWon
	^false! !

!TerniLapilliGameStateOPlays methodsFor: 'as yet unclassified' stamp: 'Luca 10/17/2019 03:44:07'!
hasPlayerXWon
	^false! !

!TerniLapilliGameStateOPlays methodsFor: 'as yet unclassified' stamp: 'Luca 10/17/2019 03:44:57'!
isOver
	^false! !

!TerniLapilliGameStateOPlays methodsFor: 'as yet unclassified' stamp: 'Luca 10/17/2019 03:43:12'!
isPlayingO
	^true! !

!TerniLapilliGameStateOPlays methodsFor: 'as yet unclassified' stamp: 'Luca 10/17/2019 03:43:06'!
isPlayingX
	^false! !

!TerniLapilliGameStateOPlays methodsFor: 'as yet unclassified' stamp: 'Luca 10/17/2019 03:43:25'!
isStillGoing
	^true! !

!TerniLapilliGameStateOPlays methodsFor: 'as yet unclassified' stamp: 'Luca 10/17/2019 03:49:48'!
nextTurn
	^TerniLapilliGameStateXPlays new! !

!TerniLapilliGameStateOPlays methodsFor: 'as yet unclassified' stamp: 'Luca 10/17/2019 04:14:26'!
playerPlaying
	^#O! !

!TerniLapilliGameStateOPlays methodsFor: 'as yet unclassified' stamp: 'Luca 10/17/2019 03:53:50'!
playerWon
	^TerniLapilliGameStateOWon new! !


!classDefinition: #TerniLapilliGameStateOWon category: #TerniLapilli!
TerniLapilliGameState subclass: #TerniLapilliGameStateOWon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliGameStateOWon methodsFor: 'as yet unclassified' stamp: 'Luca 10/17/2019 03:45:54'!
hasPlayerOWon
	^true! !

!TerniLapilliGameStateOWon methodsFor: 'as yet unclassified' stamp: 'Luca 10/17/2019 03:46:01'!
hasPlayerXWon
	^false! !

!TerniLapilliGameStateOWon methodsFor: 'as yet unclassified' stamp: 'Luca 10/17/2019 03:45:09'!
isOver
	^true! !

!TerniLapilliGameStateOWon methodsFor: 'as yet unclassified' stamp: 'Luca 10/17/2019 03:45:38'!
isPlayingO
	^false! !

!TerniLapilliGameStateOWon methodsFor: 'as yet unclassified' stamp: 'Luca 10/17/2019 03:45:35'!
isPlayingX
	^false! !

!TerniLapilliGameStateOWon methodsFor: 'as yet unclassified' stamp: 'Luca 10/17/2019 03:45:24'!
isStillGoing
	^false! !


!classDefinition: #TerniLapilliGameStateXPlays category: #TerniLapilli!
TerniLapilliGameState subclass: #TerniLapilliGameStateXPlays
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliGameStateXPlays methodsFor: 'as yet unclassified' stamp: 'Luca 10/17/2019 03:46:21'!
hasPlayerOWon
	^false! !

!TerniLapilliGameStateXPlays methodsFor: 'as yet unclassified' stamp: 'Luca 10/17/2019 03:46:17'!
hasPlayerXWon
	^false! !

!TerniLapilliGameStateXPlays methodsFor: 'as yet unclassified' stamp: 'Luca 10/17/2019 03:46:53'!
isOver
	^false! !

!TerniLapilliGameStateXPlays methodsFor: 'as yet unclassified' stamp: 'Luca 10/17/2019 03:46:29'!
isPlayingO
	^false! !

!TerniLapilliGameStateXPlays methodsFor: 'as yet unclassified' stamp: 'Luca 10/17/2019 03:46:39'!
isPlayingX
	^true! !

!TerniLapilliGameStateXPlays methodsFor: 'as yet unclassified' stamp: 'Luca 10/17/2019 03:46:48'!
isStillGoing
	^true! !

!TerniLapilliGameStateXPlays methodsFor: 'as yet unclassified' stamp: 'Luca 10/17/2019 03:49:34'!
nextTurn
	^TerniLapilliGameStateOPlays new! !

!TerniLapilliGameStateXPlays methodsFor: 'as yet unclassified' stamp: 'Luca 10/17/2019 04:15:17'!
playerPlaying
	^#X! !

!TerniLapilliGameStateXPlays methodsFor: 'as yet unclassified' stamp: 'Luca 10/17/2019 03:54:06'!
playerWon
	^TerniLapilliGameStateXWon new! !


!classDefinition: #TerniLapilliGameStateXWon category: #TerniLapilli!
TerniLapilliGameState subclass: #TerniLapilliGameStateXWon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliGameStateXWon methodsFor: 'as yet unclassified' stamp: 'Luca 10/17/2019 03:47:44'!
hasPlayerOWon
	^false! !

!TerniLapilliGameStateXWon methodsFor: 'as yet unclassified' stamp: 'Luca 10/17/2019 04:39:15'!
hasPlayerXWon
	^true! !

!TerniLapilliGameStateXWon methodsFor: 'as yet unclassified' stamp: 'Luca 10/17/2019 03:47:06'!
isOver
	^true! !

!TerniLapilliGameStateXWon methodsFor: 'as yet unclassified' stamp: 'Luca 10/17/2019 03:47:36'!
isPlayingO
	^false! !

!TerniLapilliGameStateXWon methodsFor: 'as yet unclassified' stamp: 'Luca 10/17/2019 03:47:35'!
isPlayingX
	^false! !

!TerniLapilliGameStateXWon methodsFor: 'as yet unclassified' stamp: 'Luca 10/17/2019 03:47:23'!
isStillGoing
	^false! !

TerniLapilli initialize!