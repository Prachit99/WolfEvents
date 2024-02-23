# Wolf Events
This Git repository serves as the development platform for Program 2 of the OODD course, focusing on creating Wolf Events, an event management system for NCSU. This system facilitates event exploration, ticket purchasing, and attendee feedback submission 

### Admin Credentials

The system comes preconfigured with an admin account. Use the following credentials to log in as an admin:

- **Email:** admin@gmail.com
- **Password:** password

### Setup of Project
    Make sure you have the following installed on your machine:

- [Ruby](https://www.ruby-lang.org/en/documentation/installation/)
- [Ruby on Rails](https://guides.rubyonrails.org/getting_started.html#installing-rails)
- [Bundler](https://bundler.io/)

    #### Installation Process:

1. **Clone the repository:**

    ```bash
    git clone https://github.ncsu.edu/psmhalgi/WolfEvents.git
    ```

2. **Navigate to the project directory:**

    ```bash
    cd WolfEvents
    ```

3. **Install the required gems:**

    ```bash
    bundle install
    ```

4. **Set up the database:**

    ```bash
    rails db:create
    rails db:migrate
    ```

5. **Start the Rails server:**

    ```bash
    rails server
    ```

6. **Open your browser and visit [http://localhost:3000](http://localhost:3000) to see the application.**


Please ensure to follow the proper steps and validations to maintain data consistency and security.

## User Registration and Login

1. Sign up for a new account as an Attendee.
2. Log in with your email and password.

## Components:
There are 6 main components in the system:

1. Admin

2. Attendee

3. Room

4. Event

5. Event Ticket

6. Review

### Admin Functionalities

After login as Admin, you have following functionalities:

- View admin profile and admin account details.
- View all attendees signed up to Wolf Events.
- Create, delete, edit Events, Rooms and Event Tickets.
- View all available events with details.
- View all reviews written by an Attendees.
- Search for Attendees by Event name.
- Book tickets to attend an upcoming Events.

### Attendee Functionalities

As an attendee, you can perform various actions:

- View available events and filter them based on category, date and price.
- Book event tickets from the "View upcoming events page" for self and other Attendees. 
- Check event booking history.
- Write reviews for attended events and view review of other attendees.
- Edit your profile.

### Room Functionalities

After logging in as an admin, follow these steps to create a room:

1. Click on the "View all Rooms" link.
2. Click on the "Create Room" button.
3. Fill in the required information, such as room location/address and capacity.
4. Click the "Create Room" button to create a room.
5. Admin can edit the room location and capacity.

### Event Functionalities

After logging in as an admin and a room is created, proceed to create an event:

1. In the Admin home page, find the "View All Events".
2. In View all events, click on the "Create Event" button.
3. Fill in the necessary details for the event, such as event name, date, start time, end time, ticket price, and room ID.
4. Click the "Create Event" button to save.
5. In View all events page there is show this event details page. In this admin can change Event details.
6. Using filter events can filtered based on the Event Category, Date and Ticket Price.

### Ticket Booking

As an attendee, you can book tickets for an event:

1. In the attendee dashboard, find the "View Upcoming Events" section.
2. Click on the desired event.
3. Select the "Book Event Tickets" option.
4. Fill the fields and book the event tickets.
5. Attendee can book ticket for other attendees as well.

### Review Functionalities

As an attendee, you can engage with event reviews in the following ways:

1. Navigate to the "See all reviews" section to access comprehensive feedback on past events.
2. Easily search and filter reviews by event name or attendee ID to find relevant information.
3. Contribute to the community by sharing your thoughts and ratings for events you've attended by clicking on "New Review".
4. Choose the event from the dropdwon of past attended events and give rating and feedback.
5. Easily modify or delete only your existing reviews to reflect any changes in your feedback or ratings.

#### Additional Note: 
You can use the following user credentials to access the review creation feature as the system is already populated with event tickets of past events for this user.
- email  id: test@ncsu.edu
- password: test@123



### Bonus Credit functionalities
- As an admin, you have the capability to search for attendees who have booked a specific event using the event name. Follow these steps to utilize the search function:
    1. Navigate to the Admin Dashboard.
    2. Locate the "Search Attendees for Event" section.
    3. Enter the event name in the provided search input.
    4. Click the "Search" button to retrieve a list of attendees who have booked the specified event.

- Attendee Ticket Gifting
Attendees now have the ability to purchase tickets on behalf of other attendees. This feature allows one attendee to buy a ticket for another, creating a shared experience. Both the purchaser and the recipient will be able to view and manage the ticket. To utilize this functionality:
    1. Log in as the attendee who wishes to purchase a ticket for another.
    2. Navigate to the desired event in the Attendee Dashboard.
    3. On event booking page, select other attendee for whom you want to buy tickets using the dropdown menu.
    4. Enter other details and book the tickets.

## Support

If you encounter any issues or have questions, please contact the system administrator or refer to the [documentation](#). Thank you for using WolfEvents!

## Contributors
- Prachit Mhalgi
- Sahil Sawant
- Viraj Sanap

<table>
  <tr>
    <td align="center"><a href="https://github.ncsu.edu/psmhalgi"><img src="https://avatars.githubusercontent.com/psmhalgi" width="100px;" alt=""/><br /><sub><b>Prachit Mhalgi</b></sub></a></td>
    <td align="center"><a href="https://github.ncsu.edu/ssawant2"><img src="https://avatars.githubusercontent.com/ssawant2" width="100px;" alt=""/><br /><sub><b>Sahil Sawant</b></sub></a><br /></td>
    <td align="center"><a href="https://github.ncsu.edu/vasanap"><img src="https://avatars.githubusercontent.com/vasanap" width="100px;" alt=""/><br /><sub><b>Viraj Sanap</b></sub></a><br /></td>
  </tr>
</table>
