!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:31'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/8/2012 08:20'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:33'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'First'.
	secondPushedObject := 'Second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:35'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:36'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:36'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: #'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'values actionDeciders'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'a 9/16/2019 20:58:39'!
initialize
	values := OrderedCollection new.
	actionDeciders := OrderedCollection new.
	actionDeciders add: EmptyStackActionDecider new.
	
	^self! !


!OOStack methodsFor: 'manipulation' stamp: 'a 9/16/2019 21:34:42'!
pop
	| decider |
	decider := actionDeciders removeLast.
	
	decider decidePopAction: self.
	
	^values removeLast ! !

!OOStack methodsFor: 'manipulation' stamp: 'a 9/16/2019 20:58:13'!
push: anElement
	values add: anElement.
	actionDeciders add: NonEmptyStackActionDecider new.! !

!OOStack methodsFor: 'manipulation' stamp: 'a 9/16/2019 20:44:41'!
setCurrentDecider: aDecider
	currentDecider := aDecider ! !


!OOStack methodsFor: 'query' stamp: 'a 9/16/2019 21:00:55'!
getActionDeciders
	^actionDeciders ! !

!OOStack methodsFor: 'query' stamp: 'a 9/16/2019 19:12:16'!
isEmpty
	^values isEmpty .! !

!OOStack methodsFor: 'query' stamp: 'a 9/16/2019 19:40:49'!
size
	^values size.! !

!OOStack methodsFor: 'query' stamp: 'a 9/16/2019 21:35:06'!
top
	| decider |
	decider := actionDeciders removeLast.
	
	decider decideTopAction: self.
	
	^values last.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: #'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #StackActionDecider category: #'Stack-Exercise'!
Object subclass: #StackActionDecider
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #EmptyStackActionDecider category: #'Stack-Exercise'!
StackActionDecider subclass: #EmptyStackActionDecider
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyStackActionDecider methodsFor: 'as yet unclassified' stamp: 'a 9/16/2019 21:32:58'!
decidePopAction: anEmptyStack
	anEmptyStack getActionDeciders add: self.
	^self error: OOStack stackEmptyErrorDescription.! !

!EmptyStackActionDecider methodsFor: 'as yet unclassified' stamp: 'a 9/16/2019 21:35:18'!
decideTopAction: anEmptyStack
	anEmptyStack getActionDeciders add: self.
	^self error: OOStack stackEmptyErrorDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyStackActionDecider class' category: #'Stack-Exercise'!
EmptyStackActionDecider class
	instanceVariableNames: ''!

!EmptyStackActionDecider class methodsFor: 'as yet unclassified' stamp: 'a 9/16/2019 20:26:40'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #NonEmptyStackActionDecider category: #'Stack-Exercise'!
StackActionDecider subclass: #NonEmptyStackActionDecider
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NonEmptyStackActionDecider methodsFor: 'as yet unclassified' stamp: 'a 9/16/2019 21:07:17'!
decidePopAction: aStack
	^true! !

!NonEmptyStackActionDecider methodsFor: 'as yet unclassified' stamp: 'a 9/16/2019 21:35:25'!
decideTopAction: aStack
	^true! !
