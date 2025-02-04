# Supermarket Sales Analysis
<h3>Table of Content</h3>
<ul>
  <li>Case Description</li>
  <li>Dataset Description</li>
  <li>Executive Summary</li>
  <li>Deep Dives</li>
  <li>Recommandations</li>
</ul>
<h3>Case Description</h3>
<p>This supermarket chain in Myanmar operates in three cities Yangon, Naypyitaw, and Mandalay. It accepts payments methods of cash, E-wallet and credit card. In order to improve the chain’s revenue, the company decided to perform an analysis on its sales from January 2019 to March 2019 to identify inefficiencies and high value customers. The Data analysis was done in SQL.</p>

<h3>Dataset Descriptions</h3>
<p>This is a one table dataset, and it’s downloaded from Kaggle. It’s about a Myanmar supermarket’s sales from 2019-01-2019-03. It contains numeric, categorical, and datetime data values. It has information on transactions regarding to buyers’ gender, payment method, product categories, products cost and unit purchased and the time the transaction was made.  The table has 1000 rows and 14 features. </p>

![dataset_description](https://github.com/user-attachments/assets/d2371f87-ef7f-4a03-8b12-43656e912bde)


<h3>Executive Summary</h3>
<p>Sales for the first quarter 2019, the store total sale was 307587.38 dollars and 3222966.75 dollars after 5% tax, and 307593.22 dollars of gross profit. It has a profit margin of 4.76. The city of Naypyitaw has the highest sales out of all the branches at 110568.71 dollars. Stores from other two cities Yangon and Mandalay are 106200.37 dollars and 106197.67 dollars. Female customers did more spending of 167882.92 dollars vs male of 155083.82 dollars after tax. Members had done more sales than non-members. Members spent 164223.44 dollars vs nonmember of 158743.31 dollars.</p>

![citysales](https://github.com/user-attachments/assets/47f0b1c6-dcf9-425f-a744-a9e89afe97f7)


<h3>Deep Dives</h3>
<p>Gender Sales. Female customers tend to do more purchase than male customers. In terms of each city, women clearly outspent men by a huge margin in Naypyitaw. Women spent 61685 and male 48883 dollars. In Yangon, Female spent 53269 vs male 52931. Women outspent men by a small margin. In Mandalay, however, men spent 53269 vs women 52928 dollars. Men outspent women by a small margin. Naypyitaw had the most sales at 105303.53 dollars followed by Yangon at 101143.21, and Mandalay at 101140.64 dollars. Naypyitaw’s large sales was led by the large spending made by women. </p>

<p>Member sales. Members out spend non-members in every city. Naypyitaw has the most member sale of 56881.28 dollars and the cityy’s non-member also had the highest sales of 53687.42 dollars. </p>

![member_sales](https://github.com/user-attachments/assets/5cd40b70-e6a7-4168-82a6-c2ad81c6beec)

![member_sales](https://github.com/user-attachments/assets/07e4264e-cd97-4b3b-9f0f-1723e5ff0eaf)



<p>Product Line Sales. The category with the highest sales is food and Beverages at 56144.84 dollars after tax. The category with the lowest sales was Health and beauty at 49193.73 dollars. For each month, onsumers had different priorities. Thus, the most sold products are different from months to months.</p>

![productline](https://github.com/user-attachments/assets/42250ddb-fac9-4454-804a-4a581ea2a914)

![monthly_product_sales](https://github.com/user-attachments/assets/9b1ca2b5-617e-4833-979d-6d8d47e540c0)





<p>Hour Sales. The hour with the most average sales is 14:00 with a sale after tax of 371.43 dollars. The peak shopping hours are 14, 19, 11, 13, 17 and 16. They are either before or after the lunch or dinner time. The monthly top hour sales coincide with total hour sales.</p>

![hour_sales](https://github.com/user-attachments/assets/8fdd115e-e75a-45a6-9c06-64e4b384faa1)



<p>Monthly sales. January had the most sale after tax of 116291.87 dollars. For each month, the top sales categories are Sports and travel of $21667.02, Food and beverage of 20000, and home and lifestyle of 20932 for the month of Jan, Feb, and Mar.</p>

![monthly_sales](https://github.com/user-attachments/assets/4a1ad8c1-8e53-4001-a599-d75421db29f6)


<p>Payment methods. The most popular payment methods were cash of 112206.57 dollars. Followed by E-wallet of 109993.11 dollars, then credit card of 100767.07 dollars. Breaking down to genders, Females did the most shopping in cash of 59524.21 and male of 55122.84 dollars in e-wallet. </p>

![gender_payment_sales](https://github.com/user-attachments/assets/d982c90a-45a2-4cf5-98d1-a8b2604f669f)


<p>Rating and sales. City of Naypyitaw has the highest rating of 7.07 and also the highest average sales of 337.1 dollars. However, based on the rest average rating and avg sales, there is no correlation between sales and ratings.</p>

![sales_vs_ratings](https://github.com/user-attachments/assets/57f7f7a9-dd0b-49f4-af21-1308675cf134)


<h3>Recommandations</h3>
<p>Since female had done the most shopping and by large margins in certain city; then the promotions should be targeting women shoppers. The most sales took place around lunch and dinner time, so the promotions should be concentrated around those hours. For people like to pay with e-wallet, promotion can be done through company apps. Also, the profit margins are too low only 4.6%. The super market ought to sell high margin products.</p>
