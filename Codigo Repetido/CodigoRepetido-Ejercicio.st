!classDefinition: #CantSuspend category: #'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: #'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: #'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'Luca 9/2/2019 19:19:50'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	
	self assert: (self comprobarQue: [customerBook addCustomerNamed: 'John Lennon']TomaUnTiempoMenorA: 50 * millisecond)! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Luca 9/2/2019 19:21:20'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	
	self assert: (self comprobarQue: [customerBook removeCustomerNamed: paulMcCartney]TomaUnTiempoMenorA: 100 * millisecond)! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Luca 9/2/2019 19:52:14'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	self cuando: [customerBook addCustomerNamed: ''] 
	Genere: Error
	VerificarQue: [:anError | self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
					self assert: customerBook isEmpty] ! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Luca 9/2/2019 19:54:38'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
		
	self cuando: [customerBook removeCustomerNamed: 'Paul McCartney'] 
	Genere: NotFound
	VerificarQue: [self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon)] 
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Luca 9/2/2019 21:20:39'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney accionesARealizar condicionesQueSeTienenQueMantener |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	accionesARealizar := [customerBook addCustomerNamed: paulMcCartney.
							customerBook suspendCustomerNamed: paulMcCartney].
						
	condicionesQueSeTienenQueMantener :=  [ self chequearQueActivosEsIgualA: 0 ySuspedidosEsIgualA: 1
											            yTotalEsIgualA: 1 En: customerBook.
												    customerBook includesCustomerNamed: paulMcCartney].
	
	self assert: (self despuesDe: accionesARealizar 
					   VerificarQueSiguenValiendo: condicionesQueSeTienenQueMantener)
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Luca 9/2/2019 21:20:19'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney accionesARealizar condicionesQueSeTienenQueMantener |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	
	accionesARealizar := [customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney].
						
	condicionesQueSeTienenQueMantener :=  [ self chequearQueActivosEsIgualA: 0 ySuspedidosEsIgualA: 0
											            yTotalEsIgualA: 0 En: customerBook.
												   (customerBook includesCustomerNamed: paulMcCartney) not].
	
	self assert: (self despuesDe: accionesARealizar 
					   VerificarQueSiguenValiendo: condicionesQueSeTienenQueMantener)
	! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Luca 9/2/2019 19:57:55'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
		
	self cuando: [customerBook suspendCustomerNamed: 'Paul McCartney'] 
	Genere: CantSuspend
	VerificarQue: [self assert: customerBook numberOfCustomers = 1.
		   	     self assert: (customerBook includesCustomerNamed: johnLennon)] 
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Luca 9/2/2019 19:57:41'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
		
	self cuando: [customerBook suspendCustomerNamed: johnLennon.] 
	Genere: CantSuspend
	VerificarQue: [self assert: customerBook numberOfCustomers = 1.
				     self assert: (customerBook includesCustomerNamed: johnLennon) ] 
! !


!CustomerBookTest methodsFor: 'verificadores' stamp: 'Luca 9/2/2019 21:19:06'!
chequearQueActivosEsIgualA: cantActivos ySuspedidosEsIgualA: cantSuspendidos yTotalEsIgualA: total En: customerBook
	^cantActivos = customerBook numberOfActiveCustomers and:
	cantSuspendidos = customerBook numberOfSuspendedCustomers and:
	total = customerBook numberOfCustomers.! !

!CustomerBookTest methodsFor: 'verificadores' stamp: 'Luca 9/2/2019 19:35:15'!
comprobarQue: bloque TomaUnTiempoMenorA: tiempo
	
	| millisecondsBeforeRunning millisecondsAfterRunning |

	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	bloque value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	^millisecondsAfterRunning - millisecondsBeforeRunning < ( tiempo )! !

!CustomerBookTest methodsFor: 'verificadores' stamp: 'Luca 9/2/2019 19:53:02'!
cuando: bloqueInvalido Genere: error VerificarQue: condicionesQueSeTienenQueMantener
	
	[bloqueInvalido value.
	self fail]
		on: error 
		do: condicionesQueSeTienenQueMantener! !

!CustomerBookTest methodsFor: 'verificadores' stamp: 'Luca 9/2/2019 20:06:42'!
despuesDe: bloques VerificarQueSiguenValiendo: condicionesQueSeTienenQueMantener

	bloques value.
	
	^(condicionesQueSeTienenQueMantener value) 
! !


!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'Luca 9/2/2019 20:31:43'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'Luca 9/2/2019 20:52:45'!
numberOfCustomers
	
	^self numberOfActiveCustomers  + self numberOfSuspendedCustomers ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'Luca 9/2/2019 20:51:49'!
removeCustomerNamed: aName 
 
	|noEncontradoEnActive noEncontradoEnSuspended|
	
	noEncontradoEnActive := false.
	noEncontradoEnSuspended := false.
	
	active remove: aName ifAbsent: [noEncontradoEnActive := true].
	suspended remove: aName ifAbsent: [noEncontradoEnSuspended := true].

	(noEncontradoEnActive and: noEncontradoEnSuspended)
	ifTrue: [^ NotFound signal].
	
	^aName
	
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 9/2/2019 14:41:10'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists.'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 9/2/2019 14:41:16'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty.'! !
