public class VehicleType {
    public static  VehicleType CAR = new VehicleType("CAR");
    public static  VehicleType BIKE = new VehicleType("BIKE");
    public static  VehicleType TRUCK = new VehicleType("TRUCK");

    private final String name;

    private VehicleType(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    @Override
    public String toString() {
        return name;
    }
}

    

