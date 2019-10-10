!classDefinition: #MarsRoverTest category: #'Mars Rover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRoverTest methodsFor: 'TDD' stamp: 'Luca 10/9/2019 18:16:31'!
test01NoInstructionStaysInTheSamePlace

	| rover |
	rover _ MarsRover at: 0@0 facing: 'N'.
	
	self assert: (rover move: '') position equals: 0@0.
	
	self assert: rover direction equals: 'N'.! !

!MarsRoverTest methodsFor: 'TDD' stamp: 'LI 10/10/2019 02:05:36'!
test02ForwardMovesPosition

	| rover |
	rover _ MarsRover at: 0@0 facing: 'N'.
	
	self assert: (rover move: 'f') position equals: 0@1.
	
	self assert: rover direction equals: 'N'.! !

!MarsRoverTest methodsFor: 'TDD' stamp: 'LI 10/10/2019 01:44:40'!
test03BackwardsMovesPosition

	| rover |
	rover _ MarsRover at: 0@0 facing: 'N'.
	
	self assert: (rover move: 'b') position equals: 0@-1.
	
	self assert: rover direction equals: 'N'.! !

!MarsRoverTest methodsFor: 'TDD' stamp: 'LI 10/10/2019 01:12:35'!
test04RotateRightChangesDirection

	| rover |
	rover _ MarsRover at: 0@0 facing: 'N'.
	
	self assert: (rover move: 'r') position equals: 0@0.
	
	self assert: (rover direction) equals: 'E'.! !

!MarsRoverTest methodsFor: 'TDD' stamp: 'LI 10/10/2019 01:19:14'!
test05RotateLeftChangesDirection

	| rover |
	rover _ MarsRover at: 0@0 facing: 'N'.
	
	self assert: (rover move: 'l') position equals: 0@0.
	
	self assert: rover direction equals: 'W'.! !

!MarsRoverTest methodsFor: 'TDD' stamp: 'LI 10/10/2019 01:44:48'!
test06SeveralForwardsMovePositionCorrectly
	| rover |
	rover _ MarsRover at: 0@0 facing: 'N'.
	
	self assert: (rover move: 'fff') position equals: 0@3.
	
	self assert: rover direction equals: 'N'.! !

!MarsRoverTest methodsFor: 'TDD' stamp: 'LI 10/10/2019 01:44:54'!
test07SeveralBackwardsMovePositionCorrectly
	| rover |
	rover _ MarsRover at: 0@0 facing: 'N'.
	
	self assert: (rover move: 'bbb') position equals: 0@-3.
	
	self assert: rover direction equals: 'N'.! !

!MarsRoverTest methodsFor: 'TDD' stamp: 'LI 10/10/2019 01:38:35'!
test08ForwardAndRightMovePositionCorrectly

	| rover |
	rover _ MarsRover at: 0@0 facing: 'N'.
	
	self assert: (rover move: 'ffrfrf') position equals: 1@1.
	
	self assert: rover direction equals: 'S'.! !

!MarsRoverTest methodsFor: 'TDD' stamp: 'LI 10/10/2019 01:40:27'!
test09BackwardAndLeftMovePositionCorrectly

	| rover |
	rover _ MarsRover at: 0@0 facing: 'N'.
	
	self assert: (rover move: 'bblbblbl') position equals: 2@-1.
	
	self assert: rover direction equals: 'E'.! !

!MarsRoverTest methodsFor: 'TDD' stamp: 'LI 10/10/2019 01:48:47'!
test10AllMovementCommandsMoveRoverCorrectly

	| rover |
	rover _ MarsRover at: 0@0 facing: 'N'.
	
	self assert: (rover move: 'frffflflffrfrf') position equals: 2@3.
	
	self assert: rover direction equals: 'E'.! !

!MarsRoverTest methodsFor: 'TDD' stamp: 'LI 10/10/2019 01:53:36'!
test11InvalidCommandRaisesError

	| rover |
	rover _ MarsRover at: 0@0 facing: 'N'.
	
	self 
		should: [rover move: 'fbasdash']
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: (MarsRover invalidCommand) ]! !

!MarsRoverTest methodsFor: 'TDD' stamp: 'LI 10/10/2019 02:10:32'!
test12MovesUntilInvalidCommandCorrectly

	| rover |
	rover _ MarsRover at: 0@0 facing: 'N'.
	
	self 
		should: [rover move: 'ffrfffllbasdash']
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: (MarsRover invalidCommand).
			
									   self assert: (rover move: 'f') position equals: 3@2.
	
									   self assert: rover direction equals: 'W'.]! !


!classDefinition: #MarsRover category: #'Mars Rover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position direction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRover methodsFor: 'initialization' stamp: 'Luca 10/9/2019 16:26:07'!
at: aPoint facing: aString 
	position _ aPoint .
	direction _ aString.! !


!MarsRover methodsFor: 'private' stamp: 'LI 10/10/2019 02:00:19'!
isValidCommand:aCommand	

	^(aCommand = $f) or: (aCommand = $b) or: (aCommand = $r) or: (aCommand = $l)! !


!MarsRover methodsFor: 'executing' stamp: 'LI 10/10/2019 02:56:32'!
move: aString 
	
	aString do: [ :anInstruction | (self isValidCommand: anInstruction) ifFalse: [^self error: MarsRover invalidCommand].
						 (anInstruction = $f) ifTrue:[ self stepForward].
						 (anInstruction = $b) ifTrue:[ self stepBackward].
						 (anInstruction = $r) ifTrue:[ self rotateRight].
						 (anInstruction = $l) ifTrue:[ self rotateLeft].
						  
						] ! !


!MarsRover methodsFor: 'accessing' stamp: 'Luca 10/9/2019 16:30:21'!
direction
	^direction! !

!MarsRover methodsFor: 'accessing' stamp: 'Luca 10/9/2019 16:30:04'!
position
	^position! !


!MarsRover methodsFor: 'movement' stamp: 'LI 10/10/2019 01:17:57'!
rotateLeft
	(direction = 'N') ifTrue:[ ^direction _ 'W'].
	(direction = 'E') ifTrue:[^direction _ 'N'].
	(direction = 'W') ifTrue:[^direction _ 'S']. 
	(direction = 'S') ifTrue:[^direction _ 'E']. ! !

!MarsRover methodsFor: 'movement' stamp: 'LI 10/10/2019 01:16:51'!
rotateRight
	(direction = 'N') ifTrue:[ ^direction _ 'E'].
	(direction = 'E') ifTrue:[^direction _ 'S'].
	(direction = 'W') ifTrue:[^direction _ 'N']. 
	(direction = 'S') ifTrue:[^direction _ 'W']. ! !

!MarsRover methodsFor: 'movement' stamp: 'LI 10/10/2019 01:45:26'!
stepBackward
	(direction = 'N') ifTrue:[^position _ position + (0@-1)].
	(direction = 'E') ifTrue:[^position _ position + (-1@0)].
	(direction = 'W') ifTrue:[^position _ position + (1@0)]. 
	(direction = 'S') ifTrue:[^position _ position + (0@1)]. ! !

!MarsRover methodsFor: 'movement' stamp: 'LI 10/10/2019 01:45:48'!
stepForward
	(direction = 'N') ifTrue:[ ^position _ position + (0@1)].
	(direction = 'E') ifTrue:[^position _ position + (1@0)].
	(direction = 'W') ifTrue:[^position _ position + (-1@0)]. 
	(direction = 'S') ifTrue:[^position _ position + (0@-1)]. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #'Mars Rover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'class initialization' stamp: 'Luca 10/9/2019 16:25:06'!
at: aPoint facing: aString 
	^self new at: aPoint  facing: aString! !


!MarsRover class methodsFor: 'error' stamp: 'LI 10/10/2019 02:04:36'!
invalidCommand
	^'Invalid Command'! !
