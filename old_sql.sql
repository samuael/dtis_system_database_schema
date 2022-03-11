 CREATE TABLE active_rounds (                                             
   id integer NOT NULL DEFAULT nextval('active_rounds_id_seq'::regclass),        
   branchid integer NULL,                                                        
   roundid integer NULL,                                                         
   CONSTRAINT active_rounds_pkey PRIMARY KEY (id)                                
 );                                                                              
 CREATE UNIQUE INDEX active_rounds_pkey ON active_rounds USING btree (id);

 CREATE TABLE addresses (
   id integer NOT NULL DEFAULT nextval('addresses_id_seq'::regclass),
   created_at timestamp with time zone NULL,                         
   updated_at timestamp with time zone NULL,                         
   deleted_at timestamp with time zone NULL,                         
   region text NULL,                                                 
   zone text NULL,                                                   
   woreda text NULL,                                                 
   kebele text NULL,                                                 
   city text NULL,                                                   
   owner_id integer NULL,                                            
   CONSTRAINT addresses_pkey PRIMARY KEY (id)                                       
 );                                                                                 
 CREATE UNIQUE INDEX addresses_pkey ON addresses USING btree (id);           
 CREATE INDEX idx_addresses_deleted_at ON addresses USING btree (deleted_at);


 CREATE TABLE admins (                                                 
   id integer NOT NULL DEFAULT nextval('admins_id_seq'::regclass),            
   created_at timestamp with time zone NULL,                                  
   updated_at timestamp with time zone NULL,                                  
   deleted_at timestamp with time zone NULL,                                  
   username text NULL,                                                        
   imageurl character varying(255) NOT NULL,                                  
   firstname text NULL,                                                       
   lastname text NULL,                                                        
   grand_name text NULL,                                                      
   password text NULL,                                                        
   email text NULL,                                                           
   lang text NULL,                                                            
   phone text NULL,                                                           
   createdby text NULL,                                                       
   branch_refer integer NULL,                                                 
   role text NULL,                                                            
   active boolean NULL DEFAULT true,                                          
   CONSTRAINT admins_pkey PRIMARY KEY (id)                                    
 );                                                                           
 CREATE UNIQUE INDEX admins_pkey ON admins USING btree (id);           
 CREATE INDEX idx_admins_deleted_at ON admins USING btree (deleted_at);


 CREATE TABLE asked_quetions (                                                         
   id integer NOT NULL DEFAULT nextval('asked_quetions_id_seq'::regclass),                    
   created_at timestamp with time zone NULL,                                                  
   updated_at timestamp with time zone NULL,                                                  
   deleted_at timestamp with time zone NULL,                                                  
   studentid integer NULL,                                                                    
   questionsid ARRAY NULL,                                                                    
   CONSTRAINT asked_quetions_pkey PRIMARY KEY (id)                                            
 );                                                                                           
 CREATE UNIQUE INDEX asked_quetions_pkey ON asked_quetions USING btree (id);           
 CREATE INDEX idx_asked_quetions_deleted_at ON asked_quetions USING btree (deleted_at);



 CREATE TABLE branches (                                                   
   id integer NOT NULL DEFAULT nextval('branches_id_seq'::regclass),              
   created_at timestamp with time zone NULL,                                      
   updated_at timestamp with time zone NULL,                                      
   deleted_at timestamp with time zone NULL,                                      
   name text NULL,                                                                
   country text NULL,                                                             
   address_refer integer NULL,                                                    
   licence_given_date_refer integer NULL,                                         
   email text NULL,                                                               
   moto text NULL,                                                                
   lang text NULL,                                                                
   branch_acronym text NULL,                                                      
   branch_fullname_amharic text NULL,                                             
   branch_fullname_english text NULL,                                             
   licence_number text NULL,                                                      
   city text NULL,                                                                
   createdby text NULL,                                                           
   logourl text NULL,                                                             
   phones ARRAY NULL,                                                             
   CONSTRAINT branches_pkey PRIMARY KEY (id)                                      
 );                                                                               
 CREATE UNIQUE INDEX branches_pkey ON branches USING btree (id);           
 CREATE INDEX idx_branches_deleted_at ON branches USING btree (deleted_at);


 CREATE TABLE categories (                                                     
   id integer NOT NULL DEFAULT nextval('categories_id_seq'::regclass),                
   created_at timestamp with time zone NULL,                                          
   updated_at timestamp with time zone NULL,                                          
   deleted_at timestamp with time zone NULL,                                          
   title text NULL,                                                                   
   image_url text NULL,                                                               
   branchid integer NULL,                                                             
   last_round_number integer NULL,                                                    
   trained_number_of_students integer NULL,                                           
   number_of_students_learning integer NULL,                                          
   active boolean NULL DEFAULT true,                                                  
   CONSTRAINT categories_pkey PRIMARY KEY (id)                                        
 );                                                                                   
 CREATE UNIQUE INDEX categories_pkey ON categories USING btree (id);           
 CREATE INDEX idx_categories_deleted_at ON categories USING btree (deleted_at);



  CREATE TABLE category_round (                                                                 
   category_id integer NOT NULL,                                                                      
   round_id integer NOT NULL,                                                                         
   CONSTRAINT category_round_pkey PRIMARY KEY (category_id, round_id)                                 
 );                                                                                                   
 CREATE UNIQUE INDEX category_round_pkey ON category_round USING btree (category_id, round_id);

 CREATE TABLE course_to_durations (                                                              
   id integer NOT NULL DEFAULT nextval('course_to_durations_id_seq'::regclass),                         
   created_at timestamp with time zone NULL,                                                            
   updated_at timestamp with time zone NULL,                                                            
   deleted_at timestamp with time zone NULL,                                                            
   course integer NULL,                                                                                 
   elapsed integer NULL,                                                                                
   section_refer integer NULL,                                                                          
   CONSTRAINT course_to_durations_pkey PRIMARY KEY (id)                                                 
 );                                                                                                     
 CREATE UNIQUE INDEX course_to_durations_pkey ON course_to_durations USING btree (id);           
 CREATE INDEX idx_course_to_durations_deleted_at ON course_to_durations USING btree (deleted_at);

  CREATE TABLE courses (                                                  
   id integer NOT NULL DEFAULT nextval('courses_id_seq'::regclass),             
   created_at timestamp with time zone NULL,                                    
   updated_at timestamp with time zone NULL,                                    
   deleted_at timestamp with time zone NULL,                                    
   title text NULL,                                                             
   duration integer NULL,                                                       
   categoryid integer NULL,                                                     
   owner_id integer NULL,                                                       
   branch_id integer NULL,                                                      
   CONSTRAINT courses_pkey PRIMARY KEY (id)                                     
 );                                                                             
 CREATE UNIQUE INDEX courses_pkey ON courses USING btree (id);           
 CREATE INDEX idx_courses_deleted_at ON courses USING btree (deleted_at);


 CREATE TABLE dates (                                                
   id integer NOT NULL DEFAULT nextval('dates_id_seq'::regclass),           
   created_at timestamp with time zone NULL,                                
   updated_at timestamp with time zone NULL,                                
   deleted_at timestamp with time zone NULL,                                
   name text NULL,                                                          
   day integer NULL,                                                        
   year integer NULL,                                                       
   month integer NULL,                                                      
   hour integer NULL,                                                       
   minute integer NULL,                                                     
   sub_name text NULL,                                                      
   unix bigint NULL,                                                        
   is_break_date boolean NULL DEFAULT false,                                
   branch_id integer NULL,                                                  
   owner_id integer NULL,                                                   
   round_id integer NULL,                                                   
   shift integer NULL,                                                      
   CONSTRAINT dates_pkey PRIMARY KEY (id)                                   
 );                                                                         
 CREATE UNIQUE INDEX dates_pkey ON dates USING btree (id);           
 CREATE INDEX idx_dates_deleted_at ON dates USING btree (deleted_at);


 CREATE TABLE field_assistants (                                                           
   id integer NOT NULL DEFAULT nextval('field_assistants_id_seq'::regclass),                      
   created_at timestamp with time zone NULL,                                                      
   updated_at timestamp with time zone NULL,                                                      
   deleted_at timestamp with time zone NULL,                                                      
   username text NULL,                                                                            
   firstname text NULL,                                                                           
   lastname text NULL,                                                                            
   grand_name text NULL,                                                                          
   email text NULL,                                                                               
   imageurl text NULL,                                                                            
   phonenumber text NULL,                                                                         
   lang text NULL,                                                                                
   branch_number integer NULL,                                                                    
   createdby text NULL,                                                                           
   password text NULL,                                                                            
   category_id integer NULL,                                                                      
   vehicle_id integer NULL,                                                                       
   reserved boolean NULL DEFAULT false,                                                           
   active boolean NULL DEFAULT true,                                                              
   CONSTRAINT field_assistants_pkey PRIMARY KEY (id)                                              
 );                                                                                               
 CREATE UNIQUE INDEX field_assistants_pkey ON field_assistants USING btree (id);           
 CREATE INDEX idx_field_assistants_deleted_at ON field_assistants USING btree (deleted_at);

  CREATE TABLE field_dates (                                                                    
   field_assistant_id integer NOT NULL,                                                               
   date_id integer NOT NULL,                                                                          
   CONSTRAINT field_dates_pkey PRIMARY KEY (field_assistant_id, date_id)                              
 );                                                                                                   
 CREATE UNIQUE INDEX field_dates_pkey ON field_dates USING btree (field_assistant_id, date_id);

 CREATE TABLE field_sessions (                                                         
   id integer NOT NULL DEFAULT nextval('field_sessions_id_seq'::regclass),                    
   created_at timestamp with time zone NULL,                                                  
   updated_at timestamp with time zone NULL,                                                  
   deleted_at timestamp with time zone NULL,                                                  
   start_date_id integer NULL,                                                                
   end_date_id integer NULL,                                                                  
   passed boolean NULL,                                                                       
   round_refer integer NULL,                                                                  
   fieldman_refer integer NULL,                                                               
   CONSTRAINT field_sessions_pkey PRIMARY KEY (id)                                            
 );                                                                                           
 CREATE UNIQUE INDEX field_sessions_pkey ON field_sessions USING btree (id);           
 CREATE INDEX idx_field_sessions_deleted_at ON field_sessions USING btree (deleted_at);


 CREATE TABLE field_student (                                                                       
   field_session_id integer NOT NULL,                                                                      
   student_id integer NOT NULL,                                                                            
   CONSTRAINT field_student_pkey PRIMARY KEY (field_session_id, student_id)                                
 );                                                                                                        
 CREATE UNIQUE INDEX field_student_pkey ON field_student USING btree (field_session_id, student_id);



  CREATE TABLE information (                                           
   id integer NOT NULL DEFAULT nextval('information_id_seq'::regclass),
   created_at timestamp with time zone NULL,                           
   updated_at timestamp with time zone NULL,                           
   deleted_at timestamp with time zone NULL,                           
   branch_id integer NULL,                                             
   username text NULL,                                                 
   title text NULL,                                                    
   description text NULL,                                              
   branch_name text NULL,                                              
   active boolean NULL DEFAULT true,                                   
   CONSTRAINT information_pkey PRIMARY KEY (id)                        
 );                                                                                     
 CREATE UNIQUE INDEX information_pkey ON information USING btree (id);           
 CREATE INDEX idx_information_deleted_at ON information USING btree (deleted_at);

 CREATE TABLE lectures (                                                   
   id integer NOT NULL DEFAULT nextval('lectures_id_seq'::regclass),              
   created_at timestamp with time zone NULL,                                      
   updated_at timestamp with time zone NULL,                                      
   deleted_at timestamp with time zone NULL,                                      
   branchid integer NULL,                                                         
   teacher_refer integer NULL,                                                    
   course_refer integer NULL,                                                     
   section_refer integer NULL,                                                    
   duration integer NULL,                                                         
   start_date_refer integer NULL,                                                 
   end_date_refer integer NULL,                                                   
   passed boolean NULL,                                                           
   roundid integer NULL,                                                          
   CONSTRAINT lectures_pkey PRIMARY KEY (id)                                      
 );                                                                               
 CREATE UNIQUE INDEX lectures_pkey ON lectures USING btree (id);           
 CREATE INDEX idx_lectures_deleted_at ON lectures USING btree (deleted_at);


  CREATE TABLE lectures_bussy_date (                                                                    
   teacher_id integer NOT NULL,                                                                               
   date_id integer NOT NULL,                                                                                  
   CONSTRAINT lectures_bussy_date_pkey PRIMARY KEY (teacher_id, date_id)                                      
 );                                                                                                           
 CREATE UNIQUE INDEX lectures_bussy_date_pkey ON lectures_bussy_date USING btree (teacher_id, date_id);

  CREATE TABLE payments (                                                   
   id integer NOT NULL DEFAULT nextval('payments_id_seq'::regclass),              
   created_at timestamp with time zone NULL,                                      
   updated_at timestamp with time zone NULL,                                      
   deleted_at timestamp with time zone NULL,                                      
   amount numeric NULL,                                                           
   branch_refer integer NULL,                                                     
   student_refer integer NULL,                                                    
   round_refer integer NULL,                                                      
   admin_refer integer NULL,                                                      
   date_refer integer NULL,                                                       
   CONSTRAINT payments_pkey PRIMARY KEY (id)                                      
 );                                                                               
 CREATE UNIQUE INDEX payments_pkey ON payments USING btree (id);           
 CREATE INDEX idx_payments_deleted_at ON payments USING btree (deleted_at);


 CREATE TABLE questions (                                                    
   id integer NOT NULL DEFAULT nextval('questions_id_seq'::regclass),               
   created_at timestamp with time zone NULL,                                        
   updated_at timestamp with time zone NULL,                                        
   deleted_at timestamp with time zone NULL,                                        
   body text NOT NULL,                                                              
   answers ARRAY NOT NULL,                                                          
   answerindex integer NOT NULL,                                                    
   image_directory text NULL,                                                       
   CONSTRAINT questions_pkey PRIMARY KEY (id)                                       
 );                                                                                 
 CREATE UNIQUE INDEX questions_pkey ON questions USING btree (id);           
 CREATE INDEX idx_questions_deleted_at ON questions USING btree (deleted_at);

  CREATE TABLE resources (                                                    
   id integer NOT NULL DEFAULT nextval('resources_id_seq'::regclass),               
   created_at timestamp with time zone NULL,                                        
   updated_at timestamp with time zone NULL,                                        
   deleted_at timestamp with time zone NULL,                                        
   path text NULL,                                                                  
   ud_id integer NULL,                                                              
   title text NULL,                                                                 
   description text NULL,                                                           
   uploadedby text NULL,                                                            
   uploader_image text NULL,                                                        
   snap_shoot_image text NULL,                                                      
   hls_directory text NULL,                                                         
   first_frame text NULL,                                                           
   type integer NULL,                                                               
   CONSTRAINT resources_pkey PRIMARY KEY (id)                                       
 );                                                                                 
 CREATE UNIQUE INDEX resources_pkey ON resources USING btree (id);           
 CREATE INDEX idx_resources_deleted_at ON resources USING btree (deleted_at);

  CREATE TABLE room_to_date (                                                          
   room_id integer NOT NULL,                                                                 
   date_id integer NOT NULL,                                                                 
   CONSTRAINT room_to_date_pkey PRIMARY KEY (room_id, date_id)                               
 );                                                                                          
 CREATE UNIQUE INDEX room_to_date_pkey ON room_to_date USING btree (room_id, date_id);

  CREATE TABLE rooms (                                                
   id integer NOT NULL DEFAULT nextval('rooms_id_seq'::regclass),           
   created_at timestamp with time zone NULL,                                
   updated_at timestamp with time zone NULL,                                
   deleted_at timestamp with time zone NULL,                                
   number integer NULL,                                                     
   branchid integer NULL,                                                   
   created_by text NULL,                                                    
   capacity integer NULL,                                                   
   CONSTRAINT rooms_pkey PRIMARY KEY (id)                                   
 );                                                                         
 CREATE UNIQUE INDEX rooms_pkey ON rooms USING btree (id);           
 CREATE INDEX idx_rooms_deleted_at ON rooms USING btree (deleted_at);

  CREATE TABLE round_course (                                                             
   round_id integer NOT NULL,                                                                   
   course_id integer NOT NULL,                                                                  
   CONSTRAINT round_course_pkey PRIMARY KEY (round_id, course_id)                               
 );                                                                                             
 CREATE UNIQUE INDEX round_course_pkey ON round_course USING btree (round_id, course_id);

 CREATE TABLE round_lectures (                                                                
   round_id integer NOT NULL,                                                                        
   lecture_id integer NOT NULL,                                                                      
   CONSTRAINT round_lectures_pkey PRIMARY KEY (round_id, lecture_id)                                 
 );                                                                                                  
 CREATE UNIQUE INDEX round_lectures_pkey ON round_lectures USING btree (round_id, lecture_id);

 CREATE TABLE round_section (                                                               
   round_id integer NOT NULL,                                                                      
   section_id integer NOT NULL,                                                                    
   CONSTRAINT round_section_pkey PRIMARY KEY (round_id, section_id)                                
 );                                                                                                
 CREATE UNIQUE INDEX round_section_pkey ON round_section USING btree (round_id, section_id);

  CREATE TABLE round_students (                                                                
   round_id integer NOT NULL,                                                                        
   student_id integer NOT NULL,                                                                      
   CONSTRAINT round_students_pkey PRIMARY KEY (round_id, student_id)                                 
 );                                                                                                  
 CREATE UNIQUE INDEX round_students_pkey ON round_students USING btree (round_id, student_id);


 CREATE TABLE round_teachers (                                                                
   round_id integer NOT NULL,                                                                        
   teacher_id integer NOT NULL,                                                                      
   CONSTRAINT round_teachers_pkey PRIMARY KEY (round_id, teacher_id)                                 
 );                                                                                                  
 CREATE UNIQUE INDEX round_teachers_pkey ON round_teachers USING btree (round_id, teacher_id);

CREATE TABLE round_trainers (                                                                        
   round_id integer NOT NULL,                                                                                
   field_assistant_id integer NOT NULL,                                                                      
   CONSTRAINT round_trainers_pkey PRIMARY KEY (round_id, field_assistant_id)                                 
 );                                                                                                          
 CREATE UNIQUE INDEX round_trainers_pkey ON round_trainers USING btree (round_id, field_assistant_id);

 CREATE TABLE rounds (                                                 
   id integer NOT NULL DEFAULT nextval('rounds_id_seq'::regclass),            
   created_at timestamp with time zone NULL,                                  
   updated_at timestamp with time zone NULL,                                  
   deleted_at timestamp with time zone NULL,                                  
   year integer NULL,                                                         
   roundnumber integer NULL,                                                  
   branchnumber integer NULL,                                                 
   category_refer integer NULL,                                               
   active boolean NULL,                                                       
   admin_refer integer NULL,                                                  
   cost numeric NULL,                                                         
   training_schift_code integer NULL,                                         
   training_duration integer NULL,                                            
   total_paid numeric NULL,                                                   
   on_registration boolean NULL DEFAULT true,                                 
   learning boolean NULL DEFAULT false,                                       
   studentscount integer NULL,                                                
   max_students integer NULL,                                                 
   schedule_path text NULL,                                                   
   CONSTRAINT rounds_pkey PRIMARY KEY (id)                                    
 );                                                                           
 CREATE UNIQUE INDEX rounds_pkey ON rounds USING btree (id);           
 CREATE INDEX idx_rounds_deleted_at ON rounds USING btree (deleted_at);

CREATE TABLE section_class_dates (                                                                    
   section_id integer NOT NULL,                                                                               
   date_id integer NOT NULL,                                                                                  
   CONSTRAINT section_class_dates_pkey PRIMARY KEY (section_id, date_id)                                      
 );                                                                                                           
 CREATE UNIQUE INDEX section_class_dates_pkey ON section_class_dates USING btree (section_id, date_id);

 CREATE TABLE section_lectures (                                                                    
   section_id integer NOT NULL,                                                                            
   lecture_id integer NOT NULL,                                                                            
   CONSTRAINT section_lectures_pkey PRIMARY KEY (section_id, lecture_id)                                   
 );                                                                                                        
 CREATE UNIQUE INDEX section_lectures_pkey ON section_lectures USING btree (section_id, lecture_id);

 CREATE TABLE section_students (                                                                    
   section_id integer NOT NULL,                                                                            
   student_id integer NOT NULL,                                                                            
   CONSTRAINT section_students_pkey PRIMARY KEY (section_id, student_id)                                   
 );                                                                                                        
 CREATE UNIQUE INDEX section_students_pkey ON section_students USING btree (section_id, student_id);

  CREATE TABLE section_training_dates (                                                                       
   section_id integer NOT NULL,                                                                                     
   date_id integer NOT NULL,                                                                                        
   CONSTRAINT section_training_dates_pkey PRIMARY KEY (section_id, date_id)                                         
 );                                                                                                                 
 CREATE UNIQUE INDEX section_training_dates_pkey ON section_training_dates USING btree (section_id, date_id);

 CREATE TABLE section_trainings (                                                                           
   section_id integer NOT NULL,                                                                                    
   field_session_id integer NOT NULL,                                                                              
   CONSTRAINT section_trainings_pkey PRIMARY KEY (section_id, field_session_id)                                    
 );                                                                                                                
 CREATE UNIQUE INDEX section_trainings_pkey ON section_trainings USING btree (section_id, field_session_id);

  CREATE TABLE sections (                                                   
   id integer NOT NULL DEFAULT nextval('sections_id_seq'::regclass),              
   created_at timestamp with time zone NULL,                                      
   updated_at timestamp with time zone NULL,                                      
   deleted_at timestamp with time zone NULL,                                      
   sectionname text NULL,                                                         
   room_refer integer NULL,                                                       
   categoryid integer NULL,                                                       
   round_refer integer NULL,                                                      
   owner_id integer NULL,                                                         
   CONSTRAINT sections_pkey PRIMARY KEY (id)                                      
 );                                                                               
 CREATE UNIQUE INDEX sections_pkey ON sections USING btree (id);           
 CREATE INDEX idx_sections_deleted_at ON sections USING btree (deleted_at);

 CREATE TABLE students (                                                   
   id integer NOT NULL DEFAULT nextval('students_id_seq'::regclass),              
   created_at timestamp with time zone NULL,                                      
   updated_at timestamp with time zone NULL,                                      
   deleted_at timestamp with time zone NULL,                                      
   image_number text NULL,                                                        
   username text NULL,                                                            
   firstname text NULL,                                                           
   lastname text NULL,                                                            
   grand_father_name text NULL,                                                   
   mother_name text NULL,                                                         
   nickname text NULL,                                                            
   sex text NULL,                                                                 
   birth_date_refer integer NULL,                                                 
   birth_address_refer integer NULL,                                              
   address_refer integer NULL,                                                    
   maritial_status text NULL DEFAULT 'Not Married'::text,                         
   phone_number text NULL,                                                        
   family_count integer NULL,                                                     
   partner_fullname text NULL,                                                    
   partner_phone_number text NULL,                                                
   guarantor_full_name text NULL,                                                 
   guarantor_phone_number text NULL,                                              
   guarantor_address_refer integer NULL,                                          
   previous_licence_type text NULL,                                               
   previous_licence_number text NULL,                                             
   category_id integer NULL,                                                      
   academic_status text NULL,                                                     
   password text NULL,                                                            
   lang text NULL,                                                                
   redistered_by text NULL,                                                       
   imageurl text NULL,                                                            
   asked_questions_count integer NULL,                                            
   answered_question_count integer NULL,                                          
   active boolean NULL DEFAULT true,                                              
   section_refer integer NULL,                                                    
   round_refer integer NULL,                                                      
   paid_amount numeric NULL DEFAULT 0,                                            
   branch_id integer NULL,                                                        
   CONSTRAINT students_pkey PRIMARY KEY (id)                                      
 );                                                                               
 CREATE UNIQUE INDEX students_pkey ON students USING btree (id);           
 CREATE INDEX idx_students_deleted_at ON students USING btree (deleted_at);

  CREATE TABLE teachers (                                                   
   id integer NOT NULL DEFAULT nextval('teachers_id_seq'::regclass),              
   created_at timestamp with time zone NULL,                                      
   updated_at timestamp with time zone NULL,                                      
   deleted_at timestamp with time zone NULL,                                      
   username text NULL,                                                            
   email text NULL,                                                               
   password text NULL,                                                            
   firstname text NULL,                                                           
   lastname text NULL,                                                            
   grand_name text NULL,                                                          
   branch_number integer NULL,                                                    
   createdby text NULL,                                                           
   imageurl text NULL,                                                            
   lang text NULL,                                                                
   phonenumber text NULL,                                                         
   active boolean NULL DEFAULT true,                                              
   CONSTRAINT teachers_pkey PRIMARY KEY (id)                                      
 );                                                                               
 CREATE UNIQUE INDEX teachers_pkey ON teachers USING btree (id);           
 CREATE INDEX idx_teachers_deleted_at ON teachers USING btree (deleted_at);

  CREATE TABLE vehicles (                                                             
   id integer NOT NULL DEFAULT nextval('vehicles_id_seq'::regclass),                         
   created_at timestamp with time zone NULL,                                                 
   updated_at timestamp with time zone NULL,                                                 
   deleted_at timestamp with time zone NULL,                                                 
   imageurl text NULL,                                                                       
   board_number text NULL,                                                                   
   trainer_id integer NULL,                                                                  
   branch_no integer NULL,                                                                   
   category_id integer NULL,                                                                 
   reserved boolean NULL DEFAULT false,                                                      
   CONSTRAINT vehicles_pkey PRIMARY KEY (id),                                                
   CONSTRAINT vehicles_board_number_key UNIQUE (board_number)                                
 );                                                                                          
 CREATE UNIQUE INDEX vehicles_pkey ON vehicles USING btree (id);                      
 CREATE UNIQUE INDEX vehicles_board_number_key ON vehicles USING btree (board_number);
 CREATE INDEX idx_vehicles_deleted_at ON vehicles USING btree (deleted_at);           


