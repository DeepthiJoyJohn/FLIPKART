component {
    remote any function getArrayOfStructures() {
        var data = [];
        var myQuery = queryExecute(
            "SELECT *
            FROM productclass 
            LIMIT 10",
            [],
            {datasource: "FLIPKART"}
        );

        for (var row in myQuery) {
            data.append({"id": row.id, "name": row.productclassname,"img":row.productclassimg,"link":row.productlink},
            "subNavigation":"false");
        }

        return serializeJSON(data);
    }
}