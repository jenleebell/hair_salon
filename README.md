# SalonNow

##### An app that helps a salon owner manage their salon, August 21, 2015

#### By Jennifer Lee Bell

## Description

This web app will allow a salon owner to manage their stylists as well as the client lists associated with each stylist.

## Setup

* Clone from Github (https://github.com/jenleebell/hair_salon.git)
* In terminal, run "bundle install"
* In terminal, open psql with the following specs:
    * CREATE DATABASE hair_salon;
    * \c hair_salon;
    * CREATE TABLE stylists (id serial PRIMARY KEY, name varchar, phone char(10));
    * CREATE TABLE clients (id serial PRIMARY KEY, name varchar, phone varchar, client_id int);
* In terminal, run "ruby app.rb" in the root folder
* Enjoy managing that salon!

## Technologies Used

Ruby, CSS, HTML, Postgres

### Legal

Copyright (c) 2015 Jennifer Bell

This software is licensed under the MIT license.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
