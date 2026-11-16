# Legacy Restaurant Finder ( Review ) with ASP.NET Web Forms

An educational, database-driven restaurant review and reservation management application developed using C#, ASP.NET Web Forms (.NET Framework 4.7.2), and Microsoft SQL Server.

## Features

- **User Authentication:** Account registration, login, session management, and role-based access for visitors, reviewers, and restaurant representatives.
- **Role-Based Dashboard:** Different account types can access their respective management features.
- **Restaurant Search:** Search and filter restaurants by city, state, and cuisine.
- **Restaurant Profiles:** View restaurant descriptions, addresses, contact information, business hours, images, and website links.
- **Reviews and Ratings:** Submit written reviews with ratings for food, service, atmosphere, and price.
- **Review Management:** Reviewers can view, edit, and delete their own reviews.
- **Restaurant Management:** Restaurant representatives can add and update restaurant information.
- **Review Responses:** Restaurant representatives can respond to customer reviews.
- **Reservation System:** Users can create reservations, while restaurant representatives can view and manage reservations.
- **Dynamic Data Display:** ASP.NET GridView controls display restaurant listings and customer reviews using database records.
- **Database Integration:** Microsoft SQL Server supports account data, restaurants, reviews, reservations, and related operations.

## Known Issues

- The Helpful / Not Helpful review voting functionality is currently broken.

## Notes

This educational project was developed for CIS 3342 — Server-Side Web Application Development.
It started as a restaurant finder; later, the features shifted more toward review-based.

Database connection credentials have been replaced with placeholders for security.
The application is currently being modernized separately using ASP.NET Core MVC, Razor Views, and Web APIs.
