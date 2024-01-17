# Charts

## 1. Introduction

### Overview

Chartist.js is a lightweight charting library built with SVG. It allows you to create responsive and customizable charts with ease.

### Features

- Simple and intuitive API
- Support for various chart types
- Responsive design
- Lightweight and fast rendering

### Browser Support

Chartist.js is supported on the latest versions of major browsers, including Chrome, Firefox, Safari, and Edge.

## 2. Installation

### CDN

Include Chartist.js directly from a CDN:

```html
<script src="https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.css">
```

### Downloading

Download the library from the [official Chartist.js GitHub repository](https://github.com/gionkunz/chartist-js) and include it in your project.

## 3. Getting Started

### Including Chartist

Include the Chartist library in your HTML file:

```html
<script src="path/to/chartist.min.js"></script>
<link rel="stylesheet" href="path/to/chartist.min.css">
```

### Creating a Simple Chart

Create a basic line chart:

```javascript
var data = {
    labels: ['January', 'February', 'March'],
    series: [[10, 20, 15]]
};

var options = {};

new Chartist.Line('#chart-container', data, options);
```

## 4. Basic Usage

### Line Chart

Create a line chart with tooltips and smooth animations:

```javascript
var data = {
    labels: ['January', 'February', 'March'],
    series: [[10, 20, 15]]
};

var options = {
    showPoint: true,
    lineSmooth: Chartist.Interpolation.cardinal({
        tension: 0.5
    })
};

new Chartist.Line('#line-chart', data, options);
```

### Bar Chart

Create a stacked bar chart with customized axis labels:

```javascript
var data = {
    labels: ['Q1', 'Q2', 'Q3', 'Q4'],
    series: [
        [100, 150, 200, 180],
        [80, 120, 160, 140]
    ]
};

var options = {
    stackBars: true,
    axisY: {
        labelInterpolationFnc: function (value) {
            return value + ' units';
        }
    }
};

new Chartist.Bar('#bar-chart', data, options);
```

### Pie Chart

Create a pie chart with custom styling and label interpolation:

```javascript
var data = {
    series: [25, 20, 30, 25]
};

var options = {
    donut: true,
    donutWidth: 50,
    startAngle: 270,
    total: 100,
    showLabel: true,
    labelOffset: 40,
    labelInterpolationFnc: function (value) {
        return value + '%';
    }
};

new Chartist.Pie('#pie-chart', data, options);
```

### Donut Chart

Create a donut chart with dynamic data:

```javascript
var data = {
    series: [15, 25, 20, 40]
};

var options = {
    donut: true,
    donutWidth: 50,
    startAngle: 270,
    total: 100,
    showLabel: true,
    labelOffset: 40,
    labelInterpolationFnc: function (value) {
        return value + '%';
    }
};

new Chartist.Pie('#donut-chart', data, options);
```

## 5. Advanced Usage

### Multiple Series

Combine multiple series in a line chart:

```javascript
var data = {
    labels: ['January', 'February', 'March'],
    series: [
        { name: 'Series A', data: [10, 20, 15] },
        { name: 'Series B', data: [5, 15, 10] }
    ]
};

var options = {};

new Chartist.Line('#multiple-series-chart', data, options);
```

### Custom Styling

Customize the appearance of a bar chart:

```javascript
var data = {
    labels: ['Category A', 'Category B', 'Category C'],
    series: [[100, 120, 80]]
};

var options = {
    barColors: ['#FF5733', '#33FF57', '#5733FF'],
    axisY: {
        labelInterpolationFnc: function (value) {
            return value + ' units';
        }
    }
};

new Chartist.Bar('#custom-styling-chart', data, options);
```

### Grid and Axis Customization

Customize grid and axis in a line chart:

```javascript
var data = {
    labels: ['January', 'February', 'March'],
    series: [[10, 20, 15]]
};

var options = {
    fullWidth: true,
    chartPadding: {
        right: 40
    },
    axisY: {
        labelInterpolationFnc: function (value) {
            return value + ' units';
        }
    },
    axisX: {
        showGrid: false
    }
};

new Chartist.Line('#grid-axis-customization-chart', data, options);
```
