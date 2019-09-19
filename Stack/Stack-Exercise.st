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

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'a 9/19/2019 14:21:28'!
test01FindsRightSentence
	| stack SentenceFinder |
	
	stack := OOStack new.
	stack push: 'winter is coming'.
	stack push: 'winning is everything'.
	stack push:  'The winds of Winter'.
	stack push:  'Winter is here'.
	
	SentenceFinder := SentenceFinderByPrefix new with: stack.

	self assert: (SentenceFinder find: 'Wint') includes: 'Winter is here'.
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'a 9/19/2019 14:22:06'!
test02OnlyReturnsRightSentece
	| stack SentenceFinder |
	
	stack := OOStack new.
	stack push: 'winter is coming'.
	stack push: 'winning is everything'.
	stack push:  'The winds of Winter'.
	stack push:  'Winter is here'.
	
	SentenceFinder := SentenceFinderByPrefix new with: stack.
	
	self deny: ((SentenceFinder find: 'Wint') includes: 'winter is coming').
	self deny: ((SentenceFinder find: 'Wint') includes: 'winning is everything').
	self deny: ((SentenceFinder find: 'Wint') includes: 'The winds of Winter').
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'a 9/19/2019 14:22:15'!
test03FindsAllSentencesWithPrefix
	| stack SentenceFinder|
	
	stack := OOStack new.
	stack push: 'Winter is coming'.
	stack push:  'Winter is here'.
	stack push:  'Winterfell'.
	
	SentenceFinder := SentenceFinderByPrefix new with: stack.
	
	self assert: (SentenceFinder find: 'Wint') includes: 'Winter is coming'.
	self assert: (SentenceFinder find: 'Wint') includes: 'Winter is here'.
	self assert: (SentenceFinder find: 'Wint') includes: 'Winterfell'.
	
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'a 9/19/2019 14:22:25'!
test04FindsRepeatedSentences
	| stack SentenceFinder |
	
	stack := OOStack new.
	stack push: 'winter is coming'.
	stack push:  'Winter is here'.
	stack push: 'winning is everything'.
	stack push:  'Winter is here'.
	stack push:  'The winds of Winter'.
	stack push:  'Winter is here'.
	
	SentenceFinder := SentenceFinderByPrefix new with: stack.
	
	self assert: ((SentenceFinder find: 'Wint') occurrencesOf: 'Winter is here' ) equals: 3.
	

	
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'a 9/19/2019 14:52:50'!
test05StackStaysTheSame
	| stack SentenceFinder copyStackBeforeSentenceFinder |
	
	stack := OOStack new.
	stack push: 'winter is coming'.
	stack push: 'winning is everything'.
	stack push:  'The winds of Winter'.
	stack push:  'Winter is here'.
	
	copyStackBeforeSentenceFinder  _ stack.
	
	SentenceFinder := SentenceFinderByPrefix new with: stack.
	
	SentenceFinder find: 'Wint'.
	
	self assert: copyStackBeforeSentenceFinder = stack.
	
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'a 9/19/2019 14:26:01'!
test06PrefixCantBeBlank
	| stack SentenceFinder |
	
	stack := OOStack new.
	stack push: 'winter is coming'.
	stack push: 'winning is everything'.
	stack push:  'The winds of Winter'.
	stack push:  'Winter is here'.

	SentenceFinder := SentenceFinderByPrefix new with: stack.
		
	self
		should: [ SentenceFinder find: '' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix emptyPrefixErrorDescription ]

	
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'a 9/19/2019 14:46:40'!
test07PrefixCantHaveSpaces
	| stack SentenceFinder |
	
	stack := OOStack new.
	stack push: 'winter is coming'.
	stack push: 'winning is everything'.
	stack push:  'The winds of Winter'.
	stack push:  'Winter is here'.

	SentenceFinder := SentenceFinderByPrefix new with: stack.
		
	self
		should: [ SentenceFinder find: 'Win is co' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix prefixWithSpacesErrorDescription]

	
! !


!classDefinition: #ContainerIterator category: #'Stack-Exercise'!
Object subclass: #ContainerIterator
	instanceVariableNames: 'container'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!ContainerIterator methodsFor: 'query' stamp: 'a 9/18/2019 00:18:33'!
hasMoreElements
	^container size > 0! !

!ContainerIterator methodsFor: 'query' stamp: 'a 9/18/2019 00:17:17'!
next
	container size > 0 ifTrue: [^container pop].
	
	^self class containerHasNoMoreElements 	! !


!ContainerIterator methodsFor: 'manipulation' stamp: 'a 9/18/2019 00:50:24'!
setContainer: aContainer
	container := aContainer veryDeepCopy.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ContainerIterator class' category: #'Stack-Exercise'!
ContainerIterator class
	instanceVariableNames: ''!

!ContainerIterator class methodsFor: 'as yet unclassified' stamp: 'a 9/18/2019 00:17:01'!
containerHasNoMoreElements
	^'The container has no more elements'.! !


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'values actionDeciders'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'a 9/17/2019 23:54:24'!
initialize
	values := OrderedCollection new.
	actionDeciders := OrderedCollection new.
	actionDeciders add: EmptyStackActionDecider new.
	! !


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
	instanceVariableNames: 'container'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'a 9/18/2019 00:53:25'!
with: aContainer
	container := aContainer.! !


!SentenceFinderByPrefix methodsFor: 'query' stamp: 'a 9/19/2019 14:44:49'!
find: aPrefix
	| iterator phrasesWithThePrefix |

	aPrefix isEmpty ifTrue: [self error: self class emptyPrefixErrorDescription]. 
	(aPrefix includesSubString: ' ') ifTrue: [self error: self class prefixWithSpacesErrorDescription].
	
	
	iterator := ContainerIterator new.
	iterator setContainer: container.
	
	phrasesWithThePrefix := OrderedCollection new.
	
	[iterator hasMoreElements] whileTrue: [ 
		| aPhrase |
		
		aPhrase := iterator next.
		
		(self phrase: aPhrase hasPrefix: aPrefix) ifTrue: [phrasesWithThePrefix add: aPhrase].
		].
	
	^phrasesWithThePrefix.! !

!SentenceFinderByPrefix methodsFor: 'query' stamp: 'a 9/18/2019 01:12:40'!
phrase: aPhrase hasPrefix: aPrefix
	^aPhrase beginsWith: aPrefix ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: #'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'a 9/19/2019 14:28:54'!
emptyPrefixErrorDescription
	^'El prefijo no puede ser vacío'! !

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'a 9/19/2019 14:36:39'!
prefixWithSpacesErrorDescription
	^'El prefijo no puede contener espacios vacíos'! !


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
