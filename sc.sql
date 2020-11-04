create table country
(
    id           int auto_increment
        primary key,
    country_name varchar(30) not null
);

create table area_place
(
    id              int auto_increment
        primary key,
    name_area_place varchar(30) not null,
    country_id      int         not null,
    constraint area_place_country_id_fk
        foreign key (country_id) references country (id)
);

create table district
(
    id            int auto_increment
        primary key,
    name_district varchar(30) not null,
    area_place_id int         not null,
    constraint district_area_place_id_fk
        foreign key (area_place_id) references area_place (id)
);

create table city
(
    id            int auto_increment
        primary key,
    name_city     varchar(30) not null,
    area_place_id int         not null,
    district_id   int         null,
    constraint city_area_place_id_fk
        foreign key (area_place_id) references area_place (id),
    constraint city_district_id_fk
        foreign key (district_id) references district (id)
);


