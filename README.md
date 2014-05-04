Bank Atm
=========

Assumptions and Notes

 * Assumed dumb client, no database but does have require session management capabilities
 * Security has not been treated as a high concern; should be using ssl etc
 * You can set the URL for the api the app talks to as an ENV var, application.yml is set up for this
 * Default is to run the api on port 3000 (just rails s), then run this front end on a different port (eg rails s -p 3030)
 * Have not as yet put any tests on the front end; currently only api is tested

To run the app

 * rake db:create
 * rake db:migrate
 * rake db:seed
 * rails s -p 3030
 * http://localhost:3030/

Once this is done, you can log in with Card: 1 Pin: 1111

Note: rake db:seed is not the correct way to put dummy data into the system, it should be done with a rake task, done for speed only.
