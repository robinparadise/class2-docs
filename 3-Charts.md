**Exercise 1: Bar Chart with Multiple Series**

Create a bar chart with the following data:

```javascript
var data = {
    labels: ['Category A', 'Category B', 'Category C'],
    series: [
        [100, 200, 150],
        [120, 180, 130],
        [80, 160, 200]
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

**Exercise 2: Donut Chart with Custom Styling**

Create a donut chart with the following data and customize the styling:

```javascript
var data = {
    series: [20, 15, 30, 35]
};

var options = {
    donut: true,
    donutWidth: 50,
    startAngle: 270,
    total: 200,
    showLabel: true,
    chartPadding: 30,
    labelOffset: 40,
    labelDirection: 'explode',
    labelInterpolationFnc: function (value) {
        return value + '%';
    }
};

new Chartist.Pie('#donut-chart', data, options);
```

**Exercise 3: Line Chart with Grid and Axis Customization**

Create a line chart with a grid and customized axes:

```javascript
var data = {
    labels: ['January', 'February', 'March', 'April', 'May'],
    series: [
        [5, 7, 3, 8, 4]
    ]
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

new Chartist.Line('#line-chart', data, options);
```

**Exercise 4: Bar Chart with Multiple Series**

Create a bar chart with monthly sales data for three different products:

- Product A: [120, 150, 200, 180, 250]
- Product B: [90, 120, 150, 130, 200]
- Product C: [80, 100, 120, 110, 150]

**Exercise 5: Donut Chart with Custom Styling**

Create a donut chart to represent the percentage distribution of tasks:

- Task 1: 25%
- Task 2: 20%
- Task 3: 30%
- Task 4: 25%

**Exercise 6: Line Chart with Grid and Axis Customization**

Create a line chart to visualize website traffic over the past five months:

- January: 1500 visits
- February: 1800 visits
- March: 2000 visits
- April: 2200 visits
- May: 2500 visits

