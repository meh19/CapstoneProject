create Table State
(
	StateNum int  NOT NULL auto_increment primary key,
	StateName char (50) not null,
	Abbreviation char(2)

);

create table SiteTypes
(
	SiteTypeNum int not null auto_increment primary key ,
	SiteType char (30)

);



create table Vehicle
(
	vehicleRef int  not null primary key ,
	vehicleNum int not null,
	keyNum int,
	stateNum int,
	foreign key (stateNum) references State(StateNum)
);

create table Driver
(
	driverRef int not null auto_increment primary key ,
	driverNum int not null,
	keyNum int,
	vehicle int,
	foreign key (vehicle) references Vehicle(vehicleRef)
);

create table County
(
	countyNum int not null auto_increment primary key ,
	countyName char(50) null,
	state int,
	county char(75),
	foreign key (state) references State(StateNum)
);


create table Location
(
	locationNum int not null auto_increment primary key ,
	name char (50),
	site int,
	parkingSpots char (25),
	showers char (3),
	overnight char (3),
	latitude decimal,
	longitude decimal,
	StreetNumber int,
	Street char (50),
	city char (50),
	countyNum int not null,
	zip int,
	isTerminal char (5),
	foreign key (site) references SiteTypes(SiteTypeNum),
	foreign key (countyNum) references County(countyNum)
);
create table Idle
(
	idleNum int not null auto_increment primary key,
	locationNum int not null,
	stateTime datetime not null,
	endTime datetime not null,
	duration int,
	driver int,

	foreign key(locationNum) references Location(locationNum),
	foreign key(driver) references Driver(driverRef)
 );

create table Users(
	userId int primary key auto_increment not null,
	userName char(50) not null
);

create table Passwords(
	passwordID int auto_increment not null  primary key,
	password char(20) # may need to change this type for encription
);


