      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
             Articles
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <%= link_to "Create new article", new_article_path, class: "dropdown-item"%>
          <%= link_to "View articles", new_article_path, class: "dropdown-item"%>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>



        test "should create category" do
    assert_difference('Category.count') do
      post categories_url, params: { category: {  } }
    end

    assert_redirected_to category_url(Category.last)
  end



  test "should get edit" do
    get edit_category_url(@category)
    assert_response :success
  end

  test "should update category" do
    patch category_url(@category), params: { category: {  } }
    assert_redirected_to category_url(@category)
  end

  test "should destroy category" do
    assert_difference('Category.count', -1) do
      delete category_url(@category)
    end

    assert_redirected_to categories_url
  end