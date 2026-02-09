<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <style>
        body { 
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
        padding: 30px; 
        background-color: #f9f9f9; 
    }
        table { 
            border-collapse: collapse; 
            width: 100%; 
            background: white; 
            box-shadow: 0 1px 3px rgba(0,0,0,0.1); 
        }
        th, td 
        { border: 1px solid #e0e0e0; 
            padding: 12px 15px; 
            text-align: left; 
        }
        th { 
            text-transform: uppercase; 
            font-size: 0.9rem; 
        }
        
    </style>
</head>
<body>

    <h2>Список задач h2>
    <table id="data-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Заголовок</th>
                <th>Завершено</th>
            </tr>
        </thead>
        <tbody>
            </tbody>
    </table>

    <script>
        async function loadTodos() {
            try {
                const response = await fetch('https://jsonplaceholder.typicode.com/todos?_limit=10');
                const data = await response.json();
                
                const tableBody = document.querySelector('#data-table tbody');
                tableBody.innerHTML = '';

                data.forEach(item => {
                    const row = document.createElement('tr');
                    
                    const statusText = item.completed ? 'Да' : 'Нет';
                    const statusClass = item.completed ? 'completed-yes' : 'completed-no';

                    row.innerHTML = `
                        <td>${item.id}</td>
                        <td>${item.title}</td>
                        <td class="${statusClass}">${statusText}</td>
                    `;
                    
                    tableBody.appendChild(row);
                });
            } catch (error) {
                console.error('Ошибка при загрузке данных:', error);
            }
        }

        loadTodos();
    </script>

</body>
</html>
