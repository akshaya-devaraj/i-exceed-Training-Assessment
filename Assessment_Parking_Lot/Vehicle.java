public class Vehicle {
    private final String registrationNumber;
    private final String mobileNumber;
    private final VehicleType type;

    public Vehicle(String registrationNumber, String mobileNumber, VehicleType type) {
        this.registrationNumber = registrationNumber;
        this.mobileNumber = mobileNumber;
        this.type = type;
    }

    public VehicleType getType() {
        return type;
    }

    public String getRegistrationNumber() {
        return registrationNumber;
    }

    public String getMobileNumber() {
        return mobileNumber;
    }
}
