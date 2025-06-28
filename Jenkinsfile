// Add at end of script block after results are fully populated
def html = """
<html>
<head>
    <title>uDeploy Validation Report</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; }
        h2 { color: #2e6c80; }
        table { border-collapse: collapse; width: 100%; margin-top: 20px; }
        th, td { border: 1px solid #ccc; padding: 10px; text-align: center; }
        th { background-color: #f8f8f8; }
        .pass { background-color: #d4edda; color: #155724; font-weight: bold; }
        .fail { background-color: #f8d7da; color: #721c24; font-weight: bold; }
        .notset { background-color: #fff3cd; color: #856404; font-weight: bold; }
    </style>
</head>
<body>
    <h2>uDeploy Artifact Validation Report</h2>
    <table>
        <thead>
            <tr>
                <th>Component</th>
                <th>Version</th>
                <th>manifest-es1.yml</th>
                <th>manifest-es2.yml</th>
                <th>manifest-ws2.yml</th>
                <th>ManifestPROD_Es1</th>
                <th>ManifestPROD_Es2</th>
                <th>mManifestPROD_Ws2</th>
                <th>Validation</th>
            </tr>
        </thead>
        <tbody>
"""

results.each { r ->
    def fileClass = { fname -> r.files[fname] ? "pass" : "fail" }
    def propCell = { prop ->
        def val = r.props[prop]
        if (!val) return "<td class='notset'>Not Set</td>"
        def match = r.mapping[prop] ? "pass" : "fail"
        return "<td class='${match}'>${val}</td>"
    }

    def allMatch = r.mapping.values().every { it == true } && !r.error
    def overallStatus = allMatch ? "<span class='pass'>PASS</span>" : "<span class='fail'>FAIL</span>"

    html += """
        <tr>
            <td>${r.component}</td>
            <td>${r.version}</td>
            <td class='${fileClass('manifest-es1.yml')}'>${r.files['manifest-es1.yml'] ? 'Available' : 'Missing'}</td>
            <td class='${fileClass('manifest-es2.yml')}'>${r.files['manifest-es2.yml'] ? 'Available' : 'Missing'}</td>
            <td class='${fileClass('manifest-ws2.yml')}'>${r.files['manifest-ws2.yml'] ? 'Available' : 'Missing'}</td>
            ${propCell('ManifestPROD_Es1')}
            ${propCell('ManifestPROD_Es2')}
            ${propCell('mManifestPROD_Ws2')}
            <td>${overallStatus}</td>
        </tr>
    """
}

html += """
        </tbody>
    </table>
</body>
</html>
"""

writeFile file: 'report.html', text: html
archiveArtifacts artifacts: 'report.html', fingerprint: true
