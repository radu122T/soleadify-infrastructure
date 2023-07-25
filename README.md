Scraper Project Infrastructure Repository

This repository contains the infrastructure of my Scraper project. The project is built around five microservices, all of which are containerized using Docker. These microservices are:

    - Scraper: This is the core component responsible for the scraping operations.
    - Scraper Gateway: This is the communication layer between the user and the Scraper. It sends requests from the user to the Scraper microservice.
    - PostgreSQL: This is my primary database where the scraped data gets stored.
    - Kafka: Kafka is the message broker. It helps facilitate the communication between the Scraper and the Scraper Gateway.
    - Kafka UI: This is the UI for interacting with Kafka and observing the messages being passed around.

The Scraper Gateway communicates with the Scraper through Kafka. It has a REST API that can be interacted with, along with an upload file feature where you can upload a CSV file containing the domains you wish to scrape.

However, there are some limitations to my current setup:

    - Unfortunately, I wasn't able to make the microservices work with Kubernetes. As such, all microservices are running through Docker only.
    - Currently, the Scraper Gateway is the only microservice with Swagger documentation and unit tests.

Despite these limitations, there are many areas I plan to improve:

    - Add Environment Variables: I plan to add a .env file to the infrastructure to better manage configuration settings.
    - Improve Scraper Function: I want to make the scraper function more efficient and robust.
    - Improve Error Handling: More comprehensive error handling is essential for a smoother user experience and easier debugging.
    - Security Measures: I plan to add some form of security to protect my data and services.
    - Testing and Documentation: I aim to add unit tests to the Scraper service and provide Swagger documentation for it, along with improving the existing Swagger documentation on the Scraper Gateway.
    - Kubernetes Support: My end goal is to ensure that the system works flawlessly with Kubernetes.
    - Add elastic search.
The project can be run with install.sh script.

How would you store a dataset to allow querying by company name?
Data Indexing:
    When creating an index for the company data, you should specify the company name as a text type. 
    This is because text fields are analyzed, this means when indexing data, Elasticsearch will break down the fields into searchable terms and provide full-text search capabilities.
Choosing the Right Analyzer:
    The analyzer plays a crucial role when indexing and searching text fields. Elasticsearch offers several built-in analyzers. However, for company names, the standard analyzer can be a good start. It divides text into terms on whitespace boundaries and removes most punctuation. 
    If you need to handle more complex cases like handling company suffixes (Co., Corp., Inc., etc.), you might want to use a custom analyzer.
Dealing with Variations:
    For handling variations in company names, Elasticsearch provides a feature called fuzziness. It allows for a specified amount of Levenshtein Edit Distance (LED) - the number of one-character changes that need to be made to one string to make it the same as another string. 
    When a fuzziness parameter is specified in a search query, Elasticsearch will find terms that are within the maximum edit distance specified.
    Additionally, you can use the match_phrase query to search for exact phrases, and match queries to search for individual words in any order.
N-grams and Shingles:
    n-grams are another way to handle variations. An n-gram is a contiguous sequence of n items from a given sample of text or speech. This can help to match partial words.
    Shingles are similar to n-grams, but for sequence of words. This can be used to maintain context while still allowing for some flexibility in word order.
Consider Normalizing Company Names:
    Before indexing company names into Elasticsearch, consider normalizing the company names by removing or standardizing common components like 'Inc', 'LLC', 'Corp', etc. 
    This can help improve the accuracy of search results.
