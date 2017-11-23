[1mdiff --git a/app/controllers/products_controller.rb b/app/controllers/products_controller.rb[m
[1mindex 9a22e5e..31ac5ac 100644[m
[1m--- a/app/controllers/products_controller.rb[m
[1m+++ b/app/controllers/products_controller.rb[m
[36m@@ -18,7 +18,7 @@[m [mclass ProductsController < ApplicationController[m
     @cust = Customer.find(params[:cust_id])[m
     @products = @cust.products[m
     @product = Product.new[m
[31m-    @payments = Payment.all[m
[32m+[m[32m    # @payments = Payment.all[m
   end[m
 [m
   # GET /products/1/edit[m
[1mdiff --git a/app/views/customers/_form.html.erb b/app/views/customers/_form.html.erb[m
[1mindex 68f08f5..435cee3 100644[m
[1m--- a/app/views/customers/_form.html.erb[m
[1m+++ b/app/views/customers/_form.html.erb[m
[36m@@ -11,31 +11,47 @@[m
     </div>[m
   <% end %>[m
 [m
[31m-  <div class="field">[m
[31m-    <%= f.label :first_name %><br>[m
[31m-    <%= f.text_field :first_name, placeholder: "Your First Name Here..." %>[m
[31m-  </div>[m
[31m-  <div class="field">[m
[31m-    <%= f.label :middle_name %><br>[m
[31m-    <%= f.text_field :middle_name, placeholder: "Your Middle Name Here..." %>[m
[31m-  </div>[m
[31m-  <div class="field">[m
[31m-    <%= f.label :last_name %><br>[m
[31m-    <%= f.text_field :last_name, placeholder: "Your Last Name Here..." %>[m
[31m-  </div>[m
[31m-  <div class="field">[m
[31m-    <%= f.label :address %><br>[m
[31m-    <%= f.text_field :address, placeholder: "Your Address Here..." %>[m
[31m-  </div>[m
[31m-  <div class="field">[m
[31m-    <%= f.label :mobile_num %><br>[m
[31m-    <%= f.text_field :mobile_num, placeholder: "Your Mobile No Here..." %>[m
[31m-  </div>[m
[31m-  <div class="field">[m
[31m-    <%= f.label :mail %><br>[m
[31m-    <%= f.text_field :mail, placeholder: "Your Mail Id Here..." %>[m
[31m-  </div>[m
[31m-  <div class="actions">[m
[31m-    <%= f.submit %>[m
[31m-  </div>[m
[32m+[m[32m  <table>[m
[32m+[m[32m    <div class="field">[m
[32m+[m[32m      <tr>[m
[32m+[m[32m        <td> <%= f.label :first_name %> </td>[m
[32m+[m[32m        <td>: <%= f.text_field :first_name, placeholder: "  Enter First Name..." %> </td>[m
[32m+[m[32m      </tr>[m
[32m+[m[32m    </div>[m
[32m+[m[32m    <div class="field">[m
[32m+[m[32m      <tr>[m
[32m+[m[32m        <td> <%= f.label :middle_name %> </td>[m
[32m+[m[32m        <td>: <%= f.text_field :middle_name, placeholder: "  Enter Middle Name..." %> </td>[m
[32m+[m[32m      </tr>[m
[32m+[m[32m    </div>[m
[32m+[m[32m    <div class="field">[m
[32m+[m[32m      <tr>[m
[32m+[m[32m        <td> <%= f.label :last_name %> </td>[m
[32m+[m[32m        <td>: <%= f.text_field :last_name, placeholder: "  Enter Last Name..." %> </td>[m
[32m+[m[32m      </tr>[m
[32m+[m[32m    </div>[m
[32m+[m[32m    <div class="field">[m
[32m+[m[32m      <tr>[m
[32m+[m[32m        <td> <%= f.label :address %> </td>[m
[32m+[m[32m        <td>: <%= f.text_field :address, placeholder: "  Enter Address..." %> </td>[m
[32m+[m[32m      </tr>[m
[32m+[m[32m    </div>[m
[32m+[m[32m    <div class="field">[m
[32m+[m[32m      <tr>[m
[32m+[m[32m        <td> <%= f.label :mobile_num %> </td>[m
[32m+[m[32m        <td>: <%= f.text_field :mobile_num, placeholder: "  Enter Mobile No..." %> </td>[m
[32m+[m[32m      </tr>[m
[32m+[m[32m    </div>[m
[32m+[m[32m    <div class="field">[m
[32m+[m[32m      <tr>[m
[32m+[m[32m        <td> <%= f.label :mail %> </td>[m
[32m+[m[32m        <td>: <%= f.text_field :mail, placeholder: "  Enter Mail Id..." %> </td>[m
[32m+[m[32m      </tr>[m
[32m+[m[32m    </div>[m
[32m+[m[32m    <div class="actions">[m
[32m+[m[32m      <tr align="center">[m
[32m+[m[32m        <td colspan="2"> <%= f.submit %> </td>[m
[32m+[m[32m      </tr>[m
[32m+[m[32m    </div>[m
[32m+[m[32m  </table>[m
 <% end %>[m
\ No newline at end of file[m
[1mdiff --git a/app/views/operators/_form.html.erb b/app/views/operators/_form.html.erb[m
[1mindex 16910b9..75ee859 100644[m
[1m--- a/app/views/operators/_form.html.erb[m
[1m+++ b/app/views/operators/_form.html.erb[m
[36m@@ -1,4 +1,3 @@[m
[31m-<center>[m
 <%= form_for(@operator) do |f| %>[m
   <% if @operator.errors.any? %>[m
     <div id="error_explanation">[m
[36m@@ -12,36 +11,53 @@[m
     </div>[m
   <% end %>[m
 [m
[31m-  <div class="field">[m
[31m-    <%= f.label :first_name %><br>[m
[31m-    <%= f.text_field :first_name, placeholder: "Your First Name Here..." %>[m
[31m-  </div>[m
[31m-  <div class="field">[m
[31m-    <%= f.label :middle_name %><br>[m
[31m-    <%= f.text_field :middle_name, placeholder: "Your Middle Name Here..." %>[m
[31m-  </div>[m
[31m-  <div class="field">[m
[31m-    <%= f.label :last_name %><br>[m
[31m-    <%= f.text_field :last_name, placeholder: "Your Last Name Here..."%>[m
[31m-  </div>[m
[31m-  <div class="field">[m
[31m-    <%= f.label :mobile %><br>[m
[31m-    <%= f.text_field :mobile, placeholder: "Your Mobile No Here..." %>[m
[31m-  </div>[m
[32m+[m[32m  <table border="0">[m
     <div class="field">[m
[31m-    <%= f.label :mail %><br>[m
[31m-    <%= f.text_field :mail, placeholder: "Your Mail Id Here..." %>[m
[31m-  </div>[m
[31m-  <div class="field">[m
[31m-    <%= f.label :permanent_address %><br>[m
[31m-    <%= f.text_field :permanent_address, placeholder: "Your Permanent Address Here..." %>[m
[31m-  </div>[m
[31m-  <div class="field">[m
[31m-    <%= f.label :salary %><br>[m
[31m-    <%= f.text_field :salary, placeholder: "Your Salary Here..." %>[m
[31m-  </div>[m
[31m-  <div class="actions">[m
[31m-    <%= f.submit %>[m
[31m-  </div>[m
[31m-<% end %>[m
[31m-</center>[m
\ No newline at end of file[m
[32m+[m[32m      <tr>[m
[32m+[m[32m        <td> <%= f.label :first_name %><br></td>[m
[32m+[m[32m        <td> <%= f.text_field :first_name, placeholder: "Enter First Name..." %></td>[m
[32m+[m[32m      </tr>[m
[32m+[m[32m    </div>[m
[32m+[m[32m    <div class="field">[m
[32m+[m[32m      <tr>[m
[32m+[m[32m        <td> <%= f.label :middle_name %><br></td>[m
[32m+[m[32m        <td> <%= f.text_field :middle_name, placeholder: "Enter Middle Name..." %></td>[m
[32m+[m[32m      </tr>[m
[32m+[m[32m    </div>[m
[32m+[m[32m    <div class="field">[m
[32m+[m[32m      <tr>[m
[32m+[m[32m        <td> <%= f.label :last_name %><br></td>[m
[32m+[m[32m        <td> <%= f.text_field :last_name, placeholder: "Enter Last Name...."%></td>[m
[32m+[m[32m      </tr>[m
[32m+[m[32m    </div>[m
[32m+[m[32m    <div class="field">[m
[32m+[m[32m      <tr>[m
[32m+[m[32m        <td> <%= f.label :mobile %><br></td>[m
[32m+[m[32m        <td> <%= f.text_field :mobile, placeholder: "Enter Mobile No..." %></td>[m
[32m+[m[32m      </tr>[m
[32m+[m[32m    </div>[m
[32m+[m[32m      <div class="field">[m
[32m+[m[32m      <tr>[m
[32m+[m[32m        <td> <%= f.label :mail %><br></td>[m
[32m+[m[32m        <td> <%= f.text_field :mail, placeholder: "Enter Mail Id..." %></td>[m
[32m+[m[32m      </tr>[m
[32m+[m[32m    </div>[m
[32m+[m[32m    <div class="field">[m
[32m+[m[32m      <tr>[m
[32m+[m[32m        <td> <%= f.label :permanent_address %><br></td>[m
[32m+[m[32m        <td> <%= f.text_field :permanent_address, placeholder: "Enter Permanent Address..." %></td>[m
[32m+[m[32m      </tr>[m
[32m+[m[32m    </div>[m
[32m+[m[32m    <div class="field">[m
[32m+[m[32m      <tr>[m
[32m+[m[32m        <td> <%= f.label :salary %><br></td>[m
[32m+[m[32m        <td> <%= f.text_field :salary, placeholder: "Enter Salary..." %></td>[m
[32m+[m[32m      </tr>[m
[32m+[m[32m    </div>[m
[32m+[m[32m    <div class="actions">[m
[32m+[m[32m      <tr align="center">[m
[32m+[m[32m       <td colspan="2"> <%= f.submit %> </td>[m
[32m+[m[32m     </tr>[m
[32m+[m[32m    </div>[m
[32m+[m[32m  </tabl>[m
[32m+[m[32m<% end %>[m
\ No newline at end of file[m
[1mdiff --git a/app/views/products/_form.html.erb b/app/views/products/_form.html.erb[m
[1mindex 05934cf..c7541cf 100644[m
[1m--- a/app/views/products/_form.html.erb[m
[1m+++ b/app/views/products/_form.html.erb[m
[36m@@ -46,26 +46,4 @@[m
     <th>Rs-<%= sum * 3 %></th>[m
     <th><%= sum %>/kg</th>[m
   </tbody>[m
[31m-</table>[m
[31m-[m
[31m-<table>[m
[31m-  <thead>[m
[31m-    <tr>[m
[31m-      <th>Customer</th>[m
[31m-      <th>Payment</th>[m
[31m-      <th colspan="3"></th>[m
[31m-    </tr>[m
[31m-  </thead>[m
[31m-[m
[31m-  <tbody>[m
[31m-    <% @payments.each do |payment| %>[m
[31m-      <tr>[m
[31m-        <td><%= payment.customer_id %></td>[m
[31m-        <td><%= payment.payment %></td>[m
[31m-        <td><%= link_to 'Show', payment %></td>[m
[31m-        <td><%= link_to 'Edit', edit_payment_path(payment) %></td>[m
[31m-        <td><%= link_to 'Destroy', payment, method: :delete, data: { confirm: 'Are you sure?' } %></td>[m
[31m-      </tr>[m
[31m-    <% end %>[m
[31m-  </tbody>[m
 </table>[m
\ No newline at end of file[m
[1mdiff --git a/app/views/products/show.html.erb b/app/views/products/show.html.erb[m
[1mindex d2e3700..ba4ab69 100644[m
[1m--- a/app/views/products/show.html.erb[m
[1m+++ b/app/views/products/show.html.erb[m
[36m@@ -17,7 +17,6 @@[m
 [m
 <p>[m
   <strong>Customer:</strong>[m
[31m-  <%= @product.customer.first_name %>[m
 </p>[m
 [m
 <p>[m
[36m@@ -25,5 +24,4 @@[m
   <%= @product.operator.first_name %>[m
 </p>[m
 [m
[31m-<%= link_to 'Edit', edit_products_path(cust_id: @product.customer.id, id: @product.id) %>[m
[31m-<%= link_to 'Back', products_path(cust_id: @product.customer.id) %>[m
\ No newline at end of file[m
[32m+[m[32m<%= link_to "Back", home_index_path, class: "link_back" %>[m
\ No newline at end of file[m
