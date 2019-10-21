!classDefinition: #PortfolioTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'Luca 10/19/2019 05:52:13'!
test01BalanceOfNewPortfolioIsZero

	| portfolio |
	
	portfolio _ Portfolio new.
	
	self assert: 0 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'Luca 10/20/2019 03:07:03'!
test02BalanceOfPortfolioWithOnlyOneAccountIsBalanceOfTheAccount

	| portfolio account| 
	
	account  _ ReceptiveAccount new.
	Deposit register: 50 on: account.	
	portfolio _ Portfolio new.
	
	portfolio add: account .
	
	self assert: 50 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'Luca 10/19/2019 06:12:24'!
test03TransactionsOfNewPortfolioAreEmpty

	| portfolio|
	
	portfolio _ Portfolio new.
	
	self assert: portfolio transactions isEmpty.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'Luca 10/20/2019 03:07:13'!
test04TransactionsOfPortfolioAreTheTransactionsOfTheOnlyAccount

	| portfolio account | 
	
	account  _ ReceptiveAccount new.
	Deposit register: 50 on: account.
	
	portfolio _ Portfolio new.
	
	portfolio add: account .
	
	self assert: 50 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'Luca 10/20/2019 03:07:27'!
test05TransactionsOfPortfolioAreTheTransactionsOfTheAccounts

	| portfolio account otherAccount | 
	
	account  _ ReceptiveAccount new.
	Deposit register: 50 on: account.
	otherAccount _ ReceptiveAccount new.
	Deposit register: 100 on: otherAccount.	
	portfolio _ Portfolio new.
	
	portfolio add: account .
	portfolio add: otherAccount .
	
	self assert: 150 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'Luca 10/20/2019 21:39:06'!
test06PortfolioCantHaveItselfAsAccount

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio :=  Portfolio new.
	portfolio add: account .
	
	self 
		should: [ portfolio add: portfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: Portfolio cantAddAccountErrorMessage.
			self assert: (portfolio has: account) ]

	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'Luca 10/20/2019 21:39:12'!
test07PortfolioCantHavaTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio :=  Portfolio new.
	portfolio add: account .
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: Portfolio cantAddAccountErrorMessage.
			self assert: (portfolio has: account) ]

	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'Luca 10/20/2019 21:39:18'!
test08AccountCantBeSharedBetweenDifferentLevelsOfTheTree

	| account portfolio otherPortfolio |
	
	account := ReceptiveAccount new.
	portfolio :=  Portfolio new.
	otherPortfolio _ Portfolio new.
	portfolio add: account .
	otherPortfolio add: portfolio.
	
	self 
		should: [ otherPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: Portfolio cantAddAccountErrorMessage.
			self assert: (portfolio has: account) ]

	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'Luca 10/20/2019 19:11:47'!
test09BalanceIsCalculatedInAllTree

	| account portfolio otherPortfolio otherAccount |
	
	account := ReceptiveAccount new.
	portfolio :=  Portfolio new.
	otherPortfolio _ Portfolio new.
	otherAccount _ ReceptiveAccount new.
	
	Deposit register: 100 on: account .
	Deposit register: 100 on: otherAccount.
	
	portfolio add: account .
	otherPortfolio add:otherAccount .
	
	portfolio add:otherPortfolio .
	
	self assert: (account balance + otherAccount  balance) equals: portfolio balance.
	
	

	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'Luca 10/20/2019 19:13:19'!
test10TransactionsAreSearchedInAllTree

	| account portfolio otherPortfolio otherAccount |
	
	account := ReceptiveAccount new.
	portfolio :=  Portfolio new.
	otherPortfolio _ Portfolio new.
	otherAccount _ ReceptiveAccount new.
	
	Deposit register: 100 on: account .
	Deposit register: 100 on: otherAccount.
	
	portfolio add: account .
	otherPortfolio add:otherAccount .
	
	portfolio add:otherPortfolio .
	
	self assert: (portfolio transactions) size equals: 2. 	
	

	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'Luca 10/20/2019 21:39:29'!
test11PortfolioCantAddAccountSharedWithAnotherOneHigherInTheTree

	| account portfolio otherPortfolio |
	
	account := ReceptiveAccount new.
	portfolio :=  Portfolio new.
	otherPortfolio _ Portfolio new.
	otherPortfolio add: portfolio.
	otherPortfolio add: account.

	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: (anError messageText) equals: Portfolio cantAddAccountErrorMessage.
			self assert: (otherPortfolio has: account). 
			self deny: (portfolio has:  account )]
	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'Luca 10/20/2019 21:39:54'!
test12PortfolioCantAddAnotherOneThatHasASharedAccount

	| account firstLevelPortfolio rootPortfolio secondLevelPortfolio |
	
	account := ReceptiveAccount new.
	rootPortfolio :=  Portfolio new.
	firstLevelPortfolio _ Portfolio new.
	secondLevelPortfolio _ Portfolio new.
	rootPortfolio add: firstLevelPortfolio.
	rootPortfolio add: account.
	secondLevelPortfolio add: account.
	
	self 
		should: [ firstLevelPortfolio add: secondLevelPortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: Portfolio cantAddAccountErrorMessage.
			self deny: (firstLevelPortfolio has: secondLevelPortfolio ).
			self assert: (rootPortfolio has: account).
			self assert: (secondLevelPortfolio has: account )]

	! !


!classDefinition: #ReceptiveAccountTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:48'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:54'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:02'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:46'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:54'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:21:24'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 100 on: account1.
		
	self assert: 1 equals: account1 transactions size .
	self assert: (account1 transactions includes: deposit1).
! !


!classDefinition: #Account category: #'Portfolio-Ejercicio'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!


!classDefinition: #Portfolio category: #'Portfolio-Ejercicio'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'initialization' stamp: 'Luca 10/20/2019 02:56:57'!
initialize

	accounts _ OrderedCollection  new.
	parents _ OrderedCollection new.! !


!Portfolio methodsFor: 'accessing' stamp: 'Luca 10/19/2019 06:06:53'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [0].! !

!Portfolio methodsFor: 'accessing' stamp: 'Luca 10/20/2019 21:38:24'!
has: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accessing' stamp: 'Luca 10/19/2019 06:19:01'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'accessing' stamp: 'Luca 10/19/2019 06:14:22'!
transactions
	
	| transactions |
	
	transactions _ OrderedCollection new.
	accounts do: [ :anAccount | transactions add: anAccount transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'private' stamp: 'Luca 10/20/2019 02:48:54'!
accountIsUpTheTree: anAccount

	^self fullParents anySatisfy: [ :aParent | aParent isIndirectOrDirectParent: anAccount ]! !

!Portfolio methodsFor: 'private' stamp: 'Luca 10/20/2019 20:37:37'!
addAsParent: parentAccount

	parents add: parentAccount ! !

!Portfolio methodsFor: 'private' stamp: 'Luca 10/20/2019 19:45:57'!
addToParents: aSetOfParents

	parents ifEmpty: [ aSetOfParents add: self ] ifNotEmpty: [ parents do: [ :aParent | aParent addToParents: aSetOfParents ]].


! !

!Portfolio methodsFor: 'private' stamp: 'Luca 10/20/2019 03:17:49'!
checkIfCanAddAccount: anAccount .

	(self accountIsUpTheTree: anAccount ) ifTrue: [ self error: Portfolio cantAddAccountErrorMessage].
! !

!Portfolio methodsFor: 'private' stamp: 'Luca 10/20/2019 02:12:14'!
fullParents
		
	| fullParents |
	
	fullParents := Set new.
	self addToParents: fullParents.
	
	^ fullParents! !

!Portfolio methodsFor: 'private' stamp: 'Luca 10/20/2019 02:57:45'!
isIndirectOrDirectParent: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :parentAccount | (parentAccount isIndirectOrDirectParent: anAccount) or: [ anAccount isIndirectOrDirectParent: parentAccount ]]]
	! !


!Portfolio methodsFor: 'accounts' stamp: 'Luca 10/20/2019 20:38:15'!
add: anAccount

	self checkIfCanAddAccount: anAccount .

	accounts add: anAccount.
	anAccount addAsParent: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'Portfolio-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'Luca 10/20/2019 01:34:10'!
cantAddAccountErrorMessage
	
	^'Cant add account'! !


!classDefinition: #ReceptiveAccount category: #'Portfolio-Ejercicio'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'Luca 10/20/2019 20:37:57'!
addAsParent: parentAccount! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'Luca 10/19/2019 05:42:49'!
balance

	^transactions inject: 0 into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'Luca 10/20/2019 02:58:40'!
isIndirectOrDirectParent: anAccount

	^self = anAccount ! !


!classDefinition: #AccountTransaction category: #'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'balance' stamp: 'Luca 10/19/2019 05:36:58'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'Luca 10/19/2019 05:36:27'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'Luca 10/19/2019 05:36:49'!
affectBalance: aBalance

	^aBalance - value ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !
