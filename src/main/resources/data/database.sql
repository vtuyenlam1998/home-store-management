CREATE DATABASE IF NOT EXISTS
    accessary_management;

USE
accessary_management;

CREATE TABLE IF NOT EXISTS categories (
                                          id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                          is_active TINYINT(1) DEFAULT 1 NULL,
    name VARCHAR(255) NULL
    )  ENGINE=MYISAM;

insert into accessary_management.categories ( is_active, name)
values  (1, 'Tắc kê'),
        (1, 'Fe'),
        (1, 'Bù lon');

create table if not EXISTS products
(
    id          bigint auto_increment primary key,
    detail      varchar(255)         null,
    image       varchar(255)         null,
    is_active   tinyint(1) default 1 null,
    name        varchar(100)         null,
    category_id bigint               null
    )
    engine = MyISAM;

create index FKog2rp4qthbtt2lfyhfo32lsw9
    on products (category_id);

create table if not EXISTS categories_products
(
    Category_id bigint not null,
    products_id bigint not null,
    constraint UK_rnlo43ssc3pd408u62he9udsb
    unique (products_id)
    )
    engine = MyISAM;

create index FK2a3u5mbtmtq3d4s5abajhhksf
    on categories_products (Category_id);

insert into accessary_management.products (detail, image, is_active, name, category_id)
values  ('Abcsdfnaslfnaslf', 'tks2-5032.jpg', 1, 'Tắc kê sắt', 1),
        ('Abcsdfnaslfnaslf', 'tks2-5032.jpg', 1, 'Tắc kê đạn', 1),
        ('fasdgfasgasgas', 'PHE-CAI-TAN-NOI-FI-FU-GSX-BAN-1-1.jpg', 1, 'Fe trong', 2),
        ('gasgasgasga', 'PHE-CAI-TAN-NOI-FI-FU-GSX-BAN-1-1.jpg', 1, 'Fe ngoài', 2),
        ('fasdfasfaf', 'ccdc8eb5757913f0bf02c366976e3f74.jpg', 1, 'Bù lon tròn', 3),
        ('sdfgasgagag', '108506519_p5.png', 0, 'Sắc trong', 2),
        ('fFGASGASGAG', 'ccdc8eb5757913f0bf02c366976e3f74.jpg', 1, 'Bù lon nhôm', 3),
        ('ABCdefefasfgsfsda', 'ccdc8eb5757913f0bf02c366976e3f74.jpg', 1, 'bù lon inox', 3),
        ('asgasgasgasgl', '108506519_p0.png', 0, 'Bù lon Minh Beo', 3),
        ('asfasfs', 'ccdc8eb5757913f0bf02c366976e3f74.jpg', 1, 'bù lon Sơn Phú', 3),
        ('hjbj', 'tks2-5032.jpg', 1, 'bù lon Phươc', 1),
        ('fasfasfasfasf', 'PHECAITANNOIFIFUGSXBAN11.jpg', 0, 'Fe tròn', 2),
        ('fasdgasfasg', 'tks25032.jpg', 1, 'Bù lon mỡ', 3),
        ('fasdgasfasg', 'tks25032.jpg', 0, 'Bù lon mỡ', 3);

create table if not EXISTS variants
(
    id          bigint auto_increment primary key,
    price       double               null,
    product_id  bigint               null,
    size        varchar(255)         null,
    is_active   tinyint(1) default 1 null,
    origin_name varchar(255)         null
    )
    engine = MyISAM;

create index FK95bued017vcya4rf4s7n31ew4
    on variants (product_id);

create table if not EXISTS products_variants
(
    Product_id  bigint not null,
    variants_id bigint not null,
    constraint UK_kugo0h7hkmj7xkxj3vd10nere
    unique (variants_id)
    )
    engine = MyISAM;

create index FK17gv8d4qenphr9bx9u3g6tre2
    on products_variants (Product_id);


insert into accessary_management.variants (price, product_id, size, is_active, origin_name)
values  (300, 2, '8 x 20', 1, 'Trung Quốc'),
        (310, 2, '8 x 25', 1, 'Trung Quốc'),
        (500, 3, 'N12', 1, 'Việt Nam'),
        (510, 3, 'N20', 1, 'Việt Nam');

create table if not EXISTS admins
(
    id        bigint auto_increment primary key,
    email     varchar(255)         null,
    is_active tinyint(1) default 1 null,
    password  varchar(255)         null,
    name      varchar(255)         null
    )
    engine = MyISAM;

create table if not EXISTS roles
(
    id          bigint auto_increment primary key,
    description varchar(255) null,
    name        varchar(255) null
    );

insert into accessary_management.roles (description, name)
values  ('Quản trị viên', 'ROLE_ADMIN'),
        ('Dân đen', 'ROLE_USER');

create table if not EXISTS users
(
    id             bigint auto_increment primary key,
    email          varchar(255)         null,
    is_active      tinyint(1) default 1 null,
    password       varchar(255)         null,
    activated      bit                  null,
    address        varchar(255)         null,
    avatar         varchar(255)         null,
    fullname       varchar(255)         null,
    phone          varchar(255)         null,
    remember_token varchar(255)         null,
    username       varchar(255)         null,
    role_id        bigint               not null
    )
    engine = MyISAM;

create index FKp56c1712k691lhsyewcssf40f
    on users (role_id);

insert into accessary_management.users (email, is_active, password, activated, address, avatar, fullname, phone, remember_token, username, role_id)
values  ('lam@gmail.com', 1, '$2a$10$fxefLN5d8Rkvsv8m4P1crun5t3uY2tByuW4QXfIv858kcgY1xMiPa', true, null, null, null, null, null, 'lam', 1),
        ('lam1@gmail.com', 1, '$2a$10$v1WrXeE4fN70Ui.vnsGi0OYlSTYnOUFPJDIqQi0lL8F29DIzvAgLe', true, null, null, null, null, null, 'tuyenlam', 2),
        ('lam2@gmail.com', 1, '$2a$10$kYs3PaK42aWaBD6whKZC5uQgHCQxeWCqVC/VWlQS27rguyy6Qt2M2', true, null, null, null, null, null, 'lam2', 2),
        ('vtuyenlam1998@gmail.com', 1, '$2a$10$rPfplEXJQdXnFxo.vOme1.wtBYVgBG9iDstvpXFJT7Oz9ZBqY7rsa', true, null, null, null, null, null, 'tuyenlam987', 2),
        ('vtuyenlam1998@gmail.com', 1, '$2a$10$oBYOqo5tne5jyIyRcJg1V.e2mraMhpMEh6wRpVLrdLckAXADxGMdW', true, null, null, null, null, null, 'lam345', 2);