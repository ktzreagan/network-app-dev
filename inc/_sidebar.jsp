      <%
      if(session.getAttribute("admin")==null){
      %>

     


      <% } %>
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
          <li class="nav-item nav-profile">
            <div class="nav-link">
             
              <div class="profile-name">
                <p class="name">
                  <%=session.getAttribute("name")%>
                </p>
                <p class="designation">
                  Admin
                </p>
              </div>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="dashboard">
              <i class="fa fa-home menu-icon"></i>
              <span class="menu-title">Dashboard</span>
            </a>
          </li>
          
          <li class="nav-item d-none d-lg-block">
            <a class="nav-link" data-toggle="collapse" href="#sidebar-layouts" aria-expanded="false" aria-controls="sidebar-layouts">
              <i class="fas fa-columns menu-icon"></i>
              <span class="menu-title">Products</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="sidebar-layouts">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="add_product">Manage Products</a></li>
                </ul>
            </div>
          </li>


          <li class="nav-item d-none d-lg-block">
            <a class="nav-link" data-toggle="collapse" href="#lines" aria-expanded="false" aria-controls="sidebar-layouts">
              <i class="fas fa-columns menu-icon"></i>
              <span class="menu-title">Production Lines</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="lines">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="product_allocations">Manage Production Lines</a></li>
                </ul>
            </div>
          </li>




           <li class="nav-item d-none d-lg-block">
            <a class="nav-link" data-toggle="collapse" href="#workers" aria-expanded="false" aria-controls="sidebar-layouts">
              <i class="fas fa-columns menu-icon"></i>
              <span class="menu-title">Workers Allocations</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="workers">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="allocate_workers">Manage Workers</a></li>
                </ul>
            </div>
          </li>
         
             

              <li class="nav-item d-none d-lg-block">
            <a class="nav-link" data-toggle="collapse" href="#categories" aria-expanded="false" aria-controls="sidebar-layouts">
              <i class="fas fa-columns menu-icon"></i>
              <span class="menu-title">Categories</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="categories">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="product_categories">Manage Categories</a></li>
                </ul>
            </div>
          </li>


          <li class="nav-item d-none d-lg-block">
            <a class="nav-link" data-toggle="collapse" href="#categories" aria-expanded="false" aria-controls="sidebar-layouts">
              <i class="fas fa-columns menu-icon"></i>
              <span class="menu-title">Statistics</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="categories">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="statistics">Sale Stats</a></li>
                </ul>
            </div>
          </li>



              <li class="nav-item d-none d-lg-block">
            <a class="nav-link" data-toggle="collapse" href="#shop" aria-expanded="false" aria-controls="sidebar-layouts">
              <i class="fas fa-columns menu-icon"></i>
              <span class="menu-title">Shop</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="shop">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="get_products">View Shop</a></li>
                </ul>
            </div>
          </li>


            <li class="nav-item d-none d-lg-block">
            <a class="nav-link" data-toggle="collapse" href="#admin" aria-expanded="false" aria-controls="sidebar-layouts">
              <i class="fas fa-columns menu-icon"></i>
              <span class="menu-title">Admins</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="admin">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="admin_register">View Administrators</a></li>
                </ul>
            </div>
          </li>
             
          
        </ul>
      </nav>

