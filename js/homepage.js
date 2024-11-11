document.querySelectorAll('.dropdown-menu a').forEach(function (categoryLink) {
    categoryLink.addEventListener('click', function (event) {
        if (categoryLink.getAttribute('href') !== 'SignIn.html' && categoryLink.getAttribute('href') !== 'SignUp.html') {

           
            const categoryData = categoryLink.getAttribute('data-category');

            localStorage.setItem('selectedCategory', categoryData);

            
            window.location.href = 'ProductCatalog.html';
        }
    });
});