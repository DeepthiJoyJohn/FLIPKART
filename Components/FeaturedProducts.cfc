component {
    remote any function getArrayOfStructures() {
        var featureProductNav = [];
        var myQuery = queryExecute(
            "SELECT *
            FROM productclass 
            LIMIT 10",
            [],
            {datasource: "FLIPKART"}
        );
        for (var row in myQuery) {
            featureProductNav.append({"id": row.id, "name": row.productclassname,"img":row.productclassimg,
            "link":row.productlink,"subNavigation":"false"});
        }
        return serializeJSON(featureProductNav);
    }
}