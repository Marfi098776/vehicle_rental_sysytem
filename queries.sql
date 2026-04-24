create type user_role as enum('Admin','Customer');
create type vehicle_type as enum('car','bike','truck');
create type a_status as enum('available','rented','maintenance');
create type b_status as enum('pending','confirmed','completed','cancelled');

create table users (
  user_id int primary key,
  name varchar(50),
  email varchar(200) unique,
  password varchar(100),
  phone varchar(100),
  role user_role
);

create table vehicles (
  vehicle_id int primary key,
  vehicle_name varchar(50),
  type vehicle_type,
  model varchar(50),
  registration_number varchar(50) unique,
  rental_price_per_day decimal(10,2),
  availability_status a_status
);

create table bookings (
  booking_id int primary key,
  user_id int references users(user_id),
  vehicle_id int references vehicles(vehicle_id),
  start_date date,
  end_date date,
  status b_status,
  total_cost decimal(10,2)
);


insert into users (
    user_id, 
    name, 
    email, 
    phone, 
    role
)
values
(1, 'Alice', 'alice@example.com', '01710234567', 'Customer'),
(2, 'Bob', 'bob@example.com', '0987654321', 'Admin'),
(3, 'Charlie', 'charlie@example.com', '1122334444', 'Customer');

insert into vehicles (
    vehicle_id,
    vehicle_name,
    type,
    model,
    registration_number,
    rental_price_per_day,
    availability_status
)
values
(1, 'Toyota Corolla', 'car', '2022', 'ABC-123', 50, 'available'),
(2, 'Honda Civic', 'car', '2021', 'DEF-456', 60, 'rented'),
(3, 'Yamaha R15', 'bike', '2023', 'GHI-789', 30, 'available'),
(4, 'Ford F-150', 'truck', '2020', 'JKL-012', 100, 'maintenance');

insert into bookings (
    booking_id,
    user_id,
    vehicle_id,
    start_date,
    end_date,
    status,
    total_cost
)
values
(1, 1, 2, '2023-10-01', '2023-10-05', 'completed', 240),
(2, 1, 2, '2023-11-01', '2023-11-03', 'completed', 120),
(3, 3, 2, '2023-12-01', '2023-12-02', 'confirmed', 60),
(4, 1, 1, '2023-12-10', '2023-12-12', 'pending', 100);

select
    u.name as customer_name,
    v.vehicle_name,
    b.start_date,
    b.end_date,
    b.booking_status,
    b.total_cost
from bookings b
inner join users u 
    on b.user_id = u.user_id
inner join vehicles v 
    on b.vehicle_id = v.vehicle_id;

select *
from vehicles v
where not exists (
    select 1
    from bookings b
    where b.vehicle_id = v.vehicle_id
);

select *
from vehicles
where type = 'car'
and availability_status = 'available';