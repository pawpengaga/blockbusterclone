if (document.readyState === "complete" || (document.readyState !== "loading" && !document.documentElement.doScroll)) {
  initializeTooltips();
} 

else {
  document.addEventListener("DOMContentLoaded", initializeTooltips);
}

function initializeTooltips() {

  const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
  
  tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl);
  });
}
