!classDefinition: #CartTest category: #TusLibros stamp: 'LI 10/31/2019 15:18:02'!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'as yet unclassified' stamp: 'LI 10/31/2019 14:08:40'!
test01CartShouldStartEmpty

	| cart | 
	
	cart _ Cart new.
	
	self assert: cart isEmpty.! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'LI 10/31/2019 14:50:52'!
test02AfterAddingTheCartIsNotEmpty

	| cart | 
	
	cart _ Cart new.
	
	cart add: 'aBook'.
	
	self deny:cart isEmpty.! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'LI 10/31/2019 15:02:26'!
test03BooksStayInTheCart

	| cart | 
	
	cart _ Cart new.
	
	cart add: 'aBook'.
	
	self assert: cart includes: 'aBook'.! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'LI 10/31/2019 15:09:40'!
test04BooksThatAreNotInTheCartDontShowUp

	| cart | 
	
	cart _ Cart new.
	
	cart add: 'aBook'.
	
	self assert: cart includes: 'aBook'.
	self deny: (cart includes: 'otherBook').! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'LI 10/31/2019 15:16:58'!
test05CartRemembersAmountOfBooks

	| cart | 
	
	cart _ Cart new.
	
	cart add: 'aBook'.
	cart add: 'aBook'.
	cart add: 'aBook'.
	
	self assert: (cart quantity: 'aBook' )equals: 3.
! !


!classDefinition: #Cart category: #TusLibros stamp: 'LI 10/31/2019 15:18:02'!
Object subclass: #Cart
	instanceVariableNames: 'items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'as yet unclassified' stamp: 'LI 10/31/2019 14:57:07'!
add: aBook 
	
	items at: aBook put: ((items at: aBook ifAbsent:[0])+1).! !

!Cart methodsFor: 'as yet unclassified' stamp: 'LI 10/31/2019 15:03:01'!
includes: aBook
	
	^items keys includes: aBook.
	! !

!Cart methodsFor: 'as yet unclassified' stamp: 'LI 10/31/2019 14:59:48'!
initialize

	items _ Dictionary new.! !

!Cart methodsFor: 'as yet unclassified' stamp: 'LI 10/31/2019 15:00:28'!
isEmpty
	^items keys isEmpty.! !

!Cart methodsFor: 'as yet unclassified' stamp: 'LI 10/31/2019 15:16:32'!
quantity: aBook.

	^items at: aBook ifAbsent: [0]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros stamp: 'LI 10/31/2019 15:18:02'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'as yet unclassified' stamp: 'LI 10/31/2019 14:59:35'!
initialize

	^self new.! !

Cart initialize!