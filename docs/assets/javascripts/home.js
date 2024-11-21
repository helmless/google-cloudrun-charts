document.addEventListener('DOMContentLoaded', function() {
  const featureContent = document.querySelector('.feature-content');
  
  // Create intersection observer for feature content
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('animate');
        // Once animation is triggered, stop observing
        observer.unobserve(entry.target);
      }
    });
  }, {
    threshold: 0.3, // Trigger when 30% of the element is visible
    rootMargin: '-100px' // Adjust when the animation triggers
  });

  // Start observing the feature content
  observer.observe(featureContent);
});